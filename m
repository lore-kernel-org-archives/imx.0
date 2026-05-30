Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05822D7B9
	for <imx@lists.linux.dev>; Sat, 30 May 2026 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780169626; cv=pass; b=mQdpb8HqRYV+xStZ/wA+cG9bo8FcbrLe9mr+MJXbU4AaWq6CrOw92RgwjzPMJmihIQZmb4cwjdLzzBG2akT7evDEJAZtCztqnMyc8UAsi3xpDSASjFimQidAtlGI3VfS4I6xjGtfImjCgbGT7rdJur96jB56d9eApBkbwQS4yts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780169626; c=relaxed/simple;
	bh=Ii9QhGYH8Ddx4p+nDmph5Vh8dMNnUCvxNxmYJVM6HU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhknUrMp7m8gH9MT+OcRhom3xBr4aEFAITMURDM2idQ8gfyfmbN0PaLwn+WAWZcPnn07/hzDApytBGvVgP/Cudsf1jsSldabZRCxLjxzCUm01XIdy5erUMK2c6Pu4GngjatGXspRI4mKDxIgd73n+Cdr7ATHm4+FcjnAKLERMJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CO33Of39; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CO33Of39"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso1990443a12.2
        for <imx@lists.linux.dev>; Sat, 30 May 2026 12:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780169624; cv=none;
        d=google.com; s=arc-20240605;
        b=Y209mp3eyYYMA5p0BA3dUolK93GnD79IAx8cMNddocRaqUsgIwg7PM2j/37QwkzTvj
         jxzrnKgxLD95u5TXYL7UvNM42xizwejcnocpD8s23pGBZiU3MgY2ayqTZfqIzgyxklVB
         BkQ9kTmAj5R3rckM0J3BLl/0mbXGzi5Ez3TW9cGEgh/c0VaQl5La3u1Sefvs2Tb2VT//
         KrLmbYBtvaHAQNNjCarWkrODfxm7oYZjULtdW8DSUQk5Dea660xnHoYeUoBXWM4s/bdB
         NH5t7D+wVrHFRmhFt4+icHoXc1BS1utoJk/pGJfzRyDbs/AbVahNa0EVC3Aso72/q1+q
         2ztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=;
        fh=+PJkfBo8ACLo5BJwkPo2vviRRFTKiCpwCVYMTb5vSYc=;
        b=P7eusCb2roDJxvR8SXkICzRzNi4tQQgBgyaseWyniwNAaGiDQxTZykFrnjq5EJ6RHk
         5oPDdrJiwPm9eLhZKX1xgnnAFrk5hjQra1C+/6pqvvWZ6YcjEVOcb38nMngYzBW9KG25
         FbnNo33zmndjtAKQMYLYAc4YTgcQT8umNABxMEuTnpq5KF6Q4W84N9UdzAiVQuf9WNA9
         +xmJv4N5XcC2xFD+vzMUxx1vDm6Jcf/akqs+VIyJ2y+VEL3qH/cBieS9LQu9q3xUXjas
         wQvhfJIzC5MJ+ZpCZbF3QPl7xCUOb9pPu0KUPfZQP+kZXI3qntTh5H3EwYc/G0ZM+CC3
         Pnhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780169624; x=1780774424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=;
        b=CO33Of39rBPej2/54HF0FERAW3hMVAql8gNmg4end30ejVjyUbmZLS4QCYI+W3xxiI
         lso49nirHpK6JrTulePKq6buCjxWV2Xj8nfDP2+BrPhfE0t1zDEOMpPClq4DcqWYVKLs
         +dEYHXcpBjumvWk5FzXBRYtdyEf0vEGM+PbaNc2jiwqjdBA82AzxHr1iC3lP1NsRtciz
         WM5Oy1Sb6KEbsvAQ6Vs759363+Ojw0DljRLfRxQv2FLv4ibSm+9lAO0W46GUL9fYIy8k
         ay4woifx5ufjZ13vXAGSW1S4Ke0DgHdo25CRLe7EmC+K95zEzytiTZ0Z50BIwwo4KOxW
         WWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780169624; x=1780774424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DekgsxuMi51WS5zY41eRSoIAsmckrInSkJh0VriOufM=;
        b=TN9JFqvXCXX9ubf1MBmdk0/OEOLzfHr7mUd1fsT5jxqD2VRtLBWg+xOXmnjs5x01ei
         JMCV+azPds9mnnawk0/yuZuTkshwBNml/PGjRtjgcsQQ2Gb6qPjkJ2QWAfzLEqDSeBB3
         Yuo0NwxOXnsNGTcFkAp/GrdjkwKXA9LRmuy7MebpauLmntA08jwXYuiCZ+Ow3ggdc94X
         YsvnW2ZUUbBvifFsjVgNAc0a1aMPVhM2tn14QISBBQ2DiSFSPj9WtAMDJJ8dt2H2E3uY
         WxHwZvgiaEK2dI2f3j8sunxjhzhmXrMdalv/VQ20N/WbN9qw8HljkxJfOYWNcUatyqQO
         kbmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8znnPWxPNFJGPdSiAzsEaon2hI7UZxWYFsFoGS8ilZjrPe3P0GXhLW26R21MwHnnNTUbU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTPmu+O260yujenu5HeurmXYEeHIKENeTmE5MswaJ1e8iALNRu
	RmfPdYhdS+aygzJOr3f3c89dXHYwdLaFiSYusf1yqWxb544Lu2jUmrXvliuN3NocMXhbcx+TQcP
	3QQp2uBprxo/EqdEECKFIJr973AHNX5Q=
X-Gm-Gg: Acq92OE5jdS/+G56haZkO94b7wF9plwfpSH0YMskVkE1QrZcTWCeMMiB4P1xZFRz5nn
	aRMfjjT/99YuyComwafO19I/wj7DFijsndGOzeb2MksJeJ4FM9kbWxX8kkP3PDs9QgQhQDI4cMl
	GB/L+ISArXQRakkHG9/JqTfZtYqT91T6IC40m+WmCFF9f9hcUM+FbZrDa47BHahkKtpeC9EFDWW
	VwPe/4yQI7p5eQGLufCl5SAtQtEdGZ0J8h4PkMHMkYk8MwWBDpS0A4k9aAy2GWx59DuUao31cyn
	+STc1pvde4VtfZPhr73ooMPznsNYt9S+ATXR05knkvccxocQhgiMtKiKsEhIpCyaI36ZLtfacjG
	+ImyLHSsYTsMf3aJjc9ZkDvjdb6IDJYrymK+0R21l5g6hgKgprMmjxwA4sdlMrpFfQJe+
X-Received: by 2002:a05:6402:a50e:b0:676:9c6d:7448 with SMTP id
 4fb4d7f45d1cf-68c8d008593mr1310597a12.22.1780169623588; Sat, 30 May 2026
 12:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528230616.186792-1-rosenp@gmail.com> <2026053046-bonanza-bobcat-6ed1@gregkh>
In-Reply-To: <2026053046-bonanza-bobcat-6ed1@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 30 May 2026 12:33:32 -0700
X-Gm-Features: AVHnY4K79MARsE55gPXS-mt6AcSVjDoRJ17LhtVUNVWG0hsymJZR1HNJqMyC57E
Message-ID: <CAKxU2N8Nq1hdG-C4xrbpr2OCiQuf-dZRC1GebuPu9PUE1jProA@mail.gmail.com>
Subject: Re: [PATCH] serial: mxs-auart: fix probe error paths and clock handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 3:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 28, 2026 at 04:06:16PM -0700, Rosen Penev wrote:
> > Sashiko reported three pre-existing bugs in the mxs-auart driver:
> >
> > - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
> >   prepared/enabled it, leaving register accesses in probe at risk of
> >   faulting if the bootloader had gated the clock.
> > - The error path and remove function used pdev->id instead of
> >   s->port.line to clear the auart_port[] slot.  For DT-probed devices
> >   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
> >   pointer in the array.
>
> This feels like it should be a different patch, and not burried in this
> change, right?
>
> > - The probe error path called iounmap() while the IRQ was still
> >   registered. An interrupt during that window would dereference the
> >   unmapped membase.
> >
> > All of this is a consequence of using mixed devm and non devm. Instead
> > of working around these issues, go full devm so that everything can be
> > cleaned up properly.
>
> Are you sure that devm and irq code is going to work properly?  That's
> always a very tricky code path, was this tested with the hardware to
> ensure it still works on teardown correctly?
Nope. v2 incoming.
>
> thanks,
>
> greg k-h
