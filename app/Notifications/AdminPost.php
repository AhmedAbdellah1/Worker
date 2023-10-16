<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class AdminPost extends Notification
{
    use Queueable;
    protected  $worker, $post;

    public function __construct($worker, $post)
    {
        $this->worker = $worker;
        $this->post = $post;
    }

    public function via(object $notifiable): array
    {
        // return ['mail'];
        return ['database'];
    }

    // public function toMail(object $notifiable): MailMessage
    // {
    //     return (new MailMessage)
    //         ->line('The introduction to the notification.')
    //         ->action('Notification Action', url('/'))
    //         ->line('Thank you for using our application!');
    // }

    public function toArray(object $notifiable): array
    {
        return [
            'worker' => $this->worker,
            'post' => $this->post
        ];
    }
}
