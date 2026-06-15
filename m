Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297A15A864
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517545; cv=none; b=Evsx/hJUXQ1xeJaRq14uvwYFV8Rkfn8TCgQ3y6KOOj391MiUOLVXi2/r8TblA3FQXxPKuRgZ00hqMBT6+RZxWmPpRxCZ8zvvff6gPx4ZnEHMCdHjhaqsn439vWf7APKoCXcTlT+9yrsy/O97O0xTTgju3cCcO9fQ8vhkbhKhPvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517545; c=relaxed/simple;
	bh=Lp3bI1ZiAFl3fgsj4MvXtIASEPhRTHUqn2Nm2zi3KFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N1GjctDjrSlBnnPaPEZOdJiOZegSkD2qyy3gStpeqQURGSU4bRToMXvUMjeHqb1gJgRhrMkVXAaSfzS/Ag1eOZKGA/nHuniX8I3FS97JW7v+r2VIActQQ4uf7bDNnpFM8/Vo9sZ1tnKFiN0d9L4Gpp1W3o4DsfnCOzQAjcRLIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDDP+thf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDDP+thf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F2D1F000E9;
	Mon, 15 Jun 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517544;
	bh=2nRGjkFgbZUMfziv87FmadzMBQTe+0CDOxSXFGgxwL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bDDP+thf9c/B5ur/21TmM/X1YcVqL8xYDEOB+UOk/t9tXwDEmhPThpvQvKaGq0Tuk
	 HX5eO1Ui3KBh0wJAWNfL9vi5S6gpIOEaFjNEPwsmgjAwhvbXH0air0FIhrSS5G1uwM
	 B523Pv77Ka0rSAfFUP3BDaM/vWuwrNq68Wdgh8YoFJCbzCqwoUFM+leY43Fvdjashx
	 5Sym6T8RmfN/lHVIGhAv3AcjdhqWQF4KSQ1CIIzQLrSK7oLL3hWOmbnxPtSxR6I800
	 31d2bh4Yfga2joQWPOt2KoNNgW5ccm1l5lo2eQefW/QUChZ72ovafFrn7Fcg+f+uCI
	 8dQyxaNFK1AKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin
 locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260615093824.115751-10-phucduc.bui@gmail.com>
References: <20260615093824.115751-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:59:03 +0000
Message-Id: <20260615095904.00F2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Non-synchronous timer cancellation (`timer_delete()`) and improper=
 teardown order allow race conditions and use-after-free.
- [High] Unvalidated remote processor command index allows out-of-bounds ar=
ray write.
- [High] Workqueue destroyed before ALSA component unregistration leads to =
Use-After-Free.
--

commit fb7a6469268cda085459a69bd6a9d37338ef0a42
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
   =20
Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 031e5272215d4..7210393dfa5d9 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c

[ ... ]

> @@ -71,7 +67,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg =
*msg,
>  	if (!ret) {
>  		dev_err(&rpdev->dev, "rpmsg_send cmd %d timeout!\n",
>  			msg->s_msg.header.cmd);
> -		mutex_unlock(&info->msg_lock);
>  		return -ETIMEDOUT;
>  	}

[Severity: High]
This is a pre-existing issue, but can this out-of-bounds write occur here?

Looking at the code just below this in imx_rpmsg_pcm_send_message():

	memcpy(&msg->r_msg, &info->r_msg, sizeof(struct rpmsg_r_msg));
	memcpy(&info->msg[msg->r_msg.header.cmd].r_msg,
	       &msg->r_msg, sizeof(struct rpmsg_r_msg));

The msg->r_msg.header.cmd field comes from the remote processor and is used
directly as an array index for info->msg. Since cmd is an 8-bit unsigned
integer, and the array bounds are likely smaller, a compromised remote
processor could send a command ID up to 255.

Does this allow an out-of-bounds write that corrupts adjacent heap
structures like the workqueue pointer?

[ ... ]

> @@ -681,10 +672,10 @@ static void imx_rpmsg_pcm_work(struct work_struct *=
work)
>  		info->send_message(&work_of_rpmsg->msg, info);
> =20
>  	/* update read index */
> -	spin_lock_irqsave(&info->wq_lock, flags);
> -	info->work_read_index++;
> -	info->work_read_index %=3D WORK_MAX_NUM;
> -	spin_unlock_irqrestore(&info->wq_lock, flags);
> +	scoped_guard(spinlock_irqsave, &info->wq_lock) {
> +		info->work_read_index++;
> +		info->work_read_index %=3D WORK_MAX_NUM;
> +	}
>  }

[Severity: High]
This is a pre-existing issue, but does using timer_delete() instead of
timer_delete_sync() or timer_shutdown_sync() allow the timer callback
to execute after teardown?

In imx_rpmsg_pcm_close() and imx_rpmsg_terminate_all():

	timer_delete(&info->stream_timer[substream->stream].timer);

This non-synchronous deletion means the timer callback might continue
executing concurrently. In imx_rpmsg_pcm_close(), timer_delete() is called
after flush_workqueue(), so a late timer callback could queue new work
after the stream is supposedly closed.

Additionally, imx_rpmsg_pcm_remove() does not appear to stop timers
before devres frees the info structure, potentially leading to a
use-after-free if a timer is still pending.

[Severity: High]
This isn't a bug introduced by this patch, but does the current cleanup
order in imx_rpmsg_pcm_remove() cause a use-after-free?

The driver registers the component using devm_snd_soc_register_component()
in imx_rpmsg_pcm_probe(), which relies on devres for cleanup. However, the
workqueue is explicitly destroyed in imx_rpmsg_pcm_remove():

static void imx_rpmsg_pcm_remove(struct platform_device *pdev)
{
	...
	if (info->rpmsg_wq)
		destroy_workqueue(info->rpmsg_wq);
}

Since devres runs after the remove callback returns, the component
remains active while the workqueue is already destroyed. If a stream
is closed during this window, imx_rpmsg_pcm_close() will call
flush_workqueue(info->rpmsg_wq) on the destroyed workqueue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D9
