Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC113D79F9
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271767; cv=none; b=aPJaJfAzVR555WghAxjA52K1p7AhLjO9HFBl0UByQYi52WQPm+rNBK8VqH8y3zgGg+2CfgGKsZFuTa7d++5cnQpXuodDQKTH6MI/ScvWHLmWwmZdAcc9Z0vuMP4yMmdd6eLIzx6cKDM9abmZiJ1feqpIclyL7q0VmsGt1lqmoXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271767; c=relaxed/simple;
	bh=LfF2sNV/7pwcXwUI4AmvxdsHTCMPdWCO0GIWzD+c+sI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HGEj9YsJXY0k7vW7DBsNpoUIv71rr6Eopc4qJuzLFRqD1omOjtD+ri03fLAnVpo4CLqtgQtBz/WWu4DSGzdqhLZPX9SfwUvkuT1GzN7bwLk0erqgEndqF5DKEVj3BdCTQj3kRqel+87Ad29JX3Zw2Qf1zoPZPqewmVLRAMekJ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAKcGRkg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAKcGRkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738911F000E9;
	Fri, 12 Jun 2026 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271764;
	bh=oAUa7a4lUOr/Vu8iraoIjoGWtC3/36D7okDaVsfIPhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAKcGRkgTvCC7M8KvTaq0xPrbM3TZUXMIDrCZ8Kk54RhIXL+4wtDMOe2HO66GWNBv
	 mw7hd4QOBk4L9jTf9SxRgjr47QkyB6iXztm+i/bI3+ZWygrRv3l+IK3vtmpCVqK+Mg
	 lPrF+jzA5Ufx8cTf6AOBjQZf327n56DObmKfm7hN9Yhx2wuWJMSB8LvPAfj5RAlqJt
	 S/65MnhftZDb9PC2ummqFZih9MSGyRCI8uTI6xUaxY3IesMLAmgd2WlAycULQv9bZZ
	 6x0dEuoEjCS47WnyjNxwv7+YG9rvyR2SnaZIrKC7TcnOqlOU3io9EfdnifJ8qhVd59
	 eFqEp8ldHr6OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin
 locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132639.78086-10-phucduc.bui@gmail.com>
References: <20260612132639.78086-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:42:43 +0000
Message-Id: <20260612134244.738911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Non-synchronous timer cancellation in teardown paths (`imx_rpmsg_p=
cm_close` and `imx_rpmsg_terminate_all`) can lead to use-after-free, queuei=
ng work on a destroyed workqueue, and sending messages after stream closure.
--

commit ad07813ef8b508a94e71b5247875307259ab8409
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_rpmsg: Use guard() for mutex & spin locks

This commit cleans up the code by using guard() for mutex and spin locks.
This is intended to be a refactoring with no behavior change.

> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 031e5272215d4..7210393dfa5d9 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -39,10 +39,9 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg=
 *msg,
>  	struct rpmsg_device *rpdev =3D info->rpdev;
>  	int ret =3D 0;
> =20
> -	mutex_lock(&info->msg_lock);
> +	guard(mutex)(&info->msg_lock);
>  	if (!rpdev) {
>  		dev_err(info->dev, "rpmsg channel not ready\n");
> -		mutex_unlock(&info->msg_lock);
>  		return -EINVAL;
>  	}
> =20

[ ... ]

[Severity: High]
This is a pre-existing issue, but the driver uses timer_delete() instead of
timer_delete_sync() or timer_shutdown_sync() during teardown paths.

In imx_rpmsg_pcm_close():

imx_rpmsg_pcm_close() {
        ...
        /* Flush work in workqueue to make TX_CLOSE is the last message */
        flush_workqueue(info->rpmsg_wq);
        ...
        info->send_message(msg, info);

        timer_delete(&info->stream_timer[substream->stream].timer);
        ...
}

Because timer_delete() is called after flush_workqueue(), could a concurren=
tly
firing timer insert a new TX_PERIOD_DONE work into the workqueue after the
workqueue is flushed and the close message has been sent?

Furthermore, during device unbind or module removal, the workqueue is
destroyed and the info struct is freed.

If the timer callback fires concurrently during teardown, would it attempt =
to
queue work on the destroyed workqueue and access freed memory, resulting in=
 a
use-after-free?

A similar pattern exists in imx_rpmsg_terminate_all():

imx_rpmsg_terminate_all() {
        ...
        timer_delete(&info->stream_timer[substream->stream].timer);

        return imx_rpmsg_insert_workqueue(substream, msg, info);
}

Does this non-synchronous cancellation allow out-of-order PERIOD_DONE
messages to be sent after the terminate message?

Should timer_delete_sync() be used in these paths to ensure the callback
is completely finished before proceeding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D9
