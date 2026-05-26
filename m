Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0011F3BCD32
	for <imx@lists.linux.dev>; Tue, 26 May 2026 05:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774775; cv=pass; b=fBEEDeWWRaGJRnI9HSHxQVdGm9GjvfmCnGTg0nVdkgGtB8I7xktcLBaNH+va/Ydz+5OOHWAEAC1thY/zv9oPX5NX24up146opsOcie7tHLwmvrSgqBMF+gZ9AgX/kbiuVxtmurso3L5/sOJoBykz0B0jHwTGGDsZd91PQD1o8go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774775; c=relaxed/simple;
	bh=LBFgf3mDBP4hn9JKCluRF2dF864RTZ4/VkmmBIgX/Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhHVStI8+i2ZuSPAeVXjzta35eg8EXhYHnUDAH93Y7mWywR6lLTBO1C0qGeJF3rhkVEoyhbcBrNuRHvJH4Lffs0jt0tmiVf5WI67tEuc+llEl+c4E8YULNV8uWvwvFoZ/lwpTsunWpwpARdl6ayKIha+ONpTT7O+Hq+tspHVEzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0MGnBa2; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0MGnBa2"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651c7ddf514so9094045d50.1
        for <imx@lists.linux.dev>; Mon, 25 May 2026 22:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779774772; cv=none;
        d=google.com; s=arc-20240605;
        b=JMhmgPiVz36tbNav0gCMkIxaM4iiJfLSCFtBE+e8xYchjeDoWEMSGVOfpU+WTN3ECD
         J8y8aRGUaQNswTMbpOeOuIGpLG4NeP0Nb+JxMjOPbbrpark+DZoFn3yw3uXEBc3ZgkRE
         ntSCBrxYkWgRmrOY/dbmBMqNvMAAIwxsJr67nJeuW53NQdMibTk7yzrADPECCg9/dAfM
         /i5YVOJYyPpIKEPwdV43NIImXlDFiFwre3S+hfDci7RBA7ZIfppptzKybJqRr5hOitHD
         KcAvDRMolRWIWoPLop5QqNYnN/Vw+pFI1KxqAkqFiHC4fcvXbodBdDwbJCHzpFjNAWRe
         SfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        fh=0PCNToXoDyTPSjQTm9vnvfnt5vznjktjdRTafrsGTXo=;
        b=JxS0SI9TIp1JLiLJMQqildNT5k65YdkR7WlnpFwEDJ5YOIeWE+pTmXzMI++z317bq8
         fxU9pTqMA3zEFjpgBJA4aOPHbmMX0WDMCDn+WreJS0tsGaqdTRMWuzv40zubx7BZQ+bc
         uXFTfZ8PYzt+eSnUsGy3tnTsYRsmzTTT56PwezuA6HJ4D/i3IdMdRKOQ/eZIMbF9KzQp
         +iRHG/6FHVdSMY68eMwgbCQghYIV14FE8EB+tLgYvVTYRL9SiIPnRzLvnBieMolqXpvY
         nlEdSNBhlOjSOfzLkUn+FQpemkhYP6j7R7eXxg+HTjP6C2qDonjgiOXfbnbbPJK+IbTL
         M1sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779774772; x=1780379572; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        b=C0MGnBa2xCzfTQKNpCmlHY/S730NumKo0Dm0PFm2SiNfyg4/NX5VPecWng+1t9w3bG
         j6p7IbSQkZcHz5jVzpNplBElBEuj0J61N+Z0e5mT5P3jdr3DTJdRc6vCTChPzRGkxbl8
         H9NxbqBBfOBRiNIjewJy0Vcn2vFspXeAIBCDMehvEHXuMZvUrinc1Nmhj0qHtq8VqNlX
         RazwNILtbzX2kYootLtIe6i3IZIb8BaGPweTUFMECpEE18kdihjVtpLiEfknuEpOqgj3
         y7jKVZywffUxjKjEAi/PjeRDzYanf6dxEH4lHWEnqavGMcNWZxZhlxofclCl7tknx5QE
         tS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774772; x=1780379572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        b=mlZA/t92+OjajSf6HxrvMrerhNRnakXM3DmTUNXFU57UYoW2GJj894Mp8d8yBzN9mn
         PWKkT4XJZRAFDvRSAHyVLXaQyiOeGXwklJuI5bIfnOHtg992B/J4N5TV08Ozkn4moJRI
         VioeP6Z/Ny6v6UK95slESdonxv9XvDEGJ0gxcCFb6bh/o68DrZ9rhZam/F/mcSydlIEp
         d6hi3M13DHKl7C37vY10YFDjoZYPYaDcd1wtz5RO86MQt4vRnt3uUCqtZDZ7/4Fo8Vy2
         49FEsuG3vtqrSUTadCD5YS7kNyjtVFv9vKKI5SfEhO4DsroGfBBUZRZ25go6N8xe9KRa
         izIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8VB5uUqK2hWCTiE7BGvE1crv9r2ulxU3S3qJgQPzjLbg6j+qmYXRrEb67UqEz1RNwFR0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe9UjGdGOK1jMC3hrA2HHfXq8Zyq1lYYlFHuw7AQpUjX2A/RC3
	oFntTFGNIRE7wvA5R1EUlqhJ2zOFUqGVMFMl6nsAVdzCvOxm9N16ly6SCbnhSpNQknjGQhPNOL1
	lweuYUPmYcJ6PYnlXzxotRs+gUDr7Bqg=
X-Gm-Gg: Acq92OGXHR2C9biUTV+zD5BzVRhkW74vGCU6QZgTga70p2abie7LVii/3Of1Oc6wDUE
	ykppWIUY4vttVkas0X8ubBRR/LpjItfsE2tgXasWrheY+4+8GoQfGXtvtlZhnfcRBQ/RvZM1oF/
	+GLHkqb+mm1JmIf8WE0jwjZ2QMLMx0ataghdV4lGBVo7KtJ+nvyiHG9tzQDWGWZ427QjqUcBTpi
	VPcRXQ1OOxNG+1q7xQFgNMMQP6YrfbV2knA4+GH4f/lrcNn6lKlWWfq67VvPvlnQxcJt6UpRz5P
	AVMbN6ewvE0T
X-Received: by 2002:a05:690e:11cc:b0:651:be68:77e3 with SMTP id
 956f58d0204a3-65ec98a2a85mr17519833d50.31.1779774771987; Mon, 25 May 2026
 22:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518130259.1001956-1-lgs201920130244@gmail.com> <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
In-Reply-To: <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 26 May 2026 13:52:41 +0800
X-Gm-Features: AVHnY4KKr9sNKWxiy0Iphg81sV9b0GYog6HfF4iC0Ir_KdVPm-LnQZBI08OEfrU
Message-ID: <CANUHTR-_bAft05ycvb77QP2ck5PNpFcT1nmDQ6WMhe-rD42gmg@mail.gmail.com>
Subject: Re: [PATCH] media: imx-jpeg: avoid double free on video register failure
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mirela,

On Mon, 25 May 2026 at 21:57, Mirela Rabulea <mirela.rabulea@nxp.com> wrote:
>
> > [You don't often get email from lgs201920130244@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> >
> >
> > mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
> > releases it from the err_vdev_register error path if
> > video_register_device() fails.
> >
> > This can double free the video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >    video_register_device()
> >      -> __video_register_device()
> >         -> device_register() fails
> >            -> put_device(&vdev->dev)
> >               -> v4l2_device_release()
> >                  -> vdev->release(vdev)
> >                     -> video_device_release(vdev)
> >
> >    mxc_jpeg_probe()
> >      -> err_vdev_register
> >         -> video_device_release(jpeg->dec_vdev)
> >
> > Use video_device_release_empty() while registering the device so that
> > registration failure paths do not free jpeg->dec_vdev through
> > vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
> > once from err_vdev_register. Restore video_device_release() after
> > successful registration so the registered device keeps its normal lifetime
> > handling.
> >
> > This issue was found by a static analysis tool I am developing.
> >
> > Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> Hi Guangshuo,
>
> sorry for the late response, so I assume this patch will be dropped in
> favor of a fix in v4l2-core, as per discussions here?:
>
> https://lore.kernel.org/linux-media/20260519090819.1041314-1-lgs201920130244@gmail.com/
>
> Thanks,
>
> Mirela
>
> > ---
> >   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index b442dcba02e7..fe8a373576ef 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> >          jpeg->dec_vdev->fops = &mxc_jpeg_fops;
> >          jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
> >          jpeg->dec_vdev->minor = -1;
> > -       jpeg->dec_vdev->release = video_device_release;
> > +       jpeg->dec_vdev->release = video_device_release_empty;
> >          jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
> >          jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
> >          jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> > @@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> >                  dev_err(dev, "failed to register video device\n");
> >                  goto err_vdev_register;
> >          }
> > +       jpeg->dec_vdev->release = video_device_release;
> > +
> >          if (mode == MXC_JPEG_ENCODE)
> >                  v4l2_info(&jpeg->v4l2_dev,
> >                            "encoder device registered as /dev/video%d (%d,%d)\n",
> > --
> > 2.43.0
> >
Yes, you are right. Please drop this patch.

As discussed in the related thread, this issue should be fixed in
v4l2-core instead of handling it in the imx-jpeg driver.

Thanks for checking.

Best regards,
Guangshuo
