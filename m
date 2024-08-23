Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF7142E70
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400695; cv=none; b=VC7oAThITqbl4ISQkakiBOAIvhKj4QldD7Wq2o41UQ3FKvREYnUwN73C+8qFdT6JvA+aesEMCsz96t/iuZv2EATlqlQsibZiAnlasqQRJEZewzq7XBFWN9O9f9fzTri2pUlqrN/vpRjIIp8iR1QTLIAUA7Me2H+NG2nyWSgYar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400695; c=relaxed/simple;
	bh=VhHPy1791sBAtIkxnc0cQsBzjzb0bd38en4YIw5aT9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZ3II2fTrPDQNr4BOxphzEqvt7WlfUpDxeFvILwjctMcmpfOCtStfMnRSDK6USY6d6Bxtvh1XhUU1n6BOrTMgpM100g8cg8Q54WwPkeWCvez1u3mFmZJOsnAzJkPQnaPSRqWBgj6iU5b3ZllH7yeyyXLI9HogkHn8InndUDZ/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CObsXOWJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CObsXOWJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so1991789a12.1
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724400692; x=1725005492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhHPy1791sBAtIkxnc0cQsBzjzb0bd38en4YIw5aT9o=;
        b=CObsXOWJkNz8zosXFykzaerDrOCyMyn9u0cxWbbZCwHi6z4z+1daiT34ec6Cc8dCTm
         Y1pcXd6CCIxwFy/mJJ66xwnJGmTp451k+ccLmPGNQE7FzapQiPORb0O9o4Y9E1sN94it
         lCzEecaiANwmV7EZNNEp8w9STnRwgK3aCetUlSvO70gggfPRT/4Yvi1rh6rnNWX5EW7A
         z8qMM/XIEIIRQ42RoCaIRonzDT+gNO+sQSl+ukf8yWT1xaoLF1xLn226X2LQlFEjb1uB
         ErwWvMxWyUFmVTJRv6c1qMO/YCzwLm9qh3ti+BzM+kb1AuxAhqn8nanJo/7TvLeU713G
         kPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724400692; x=1725005492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhHPy1791sBAtIkxnc0cQsBzjzb0bd38en4YIw5aT9o=;
        b=F/NGHOp/N1TLLl4kvzIzO7OnZGMNlKlWp9xIfxBiYKHjPd+T1Xo/lk/imsX2gX0Wbu
         f3J0f0OHUiVBaY7msC4HAj+vnebKKoAtLs6MQSnmO5opyWs+He+d2smUJOPWW3Gh8p4i
         wkmsL27I4yYvvM24XXLJpoFmAf5MvVVHDJoD61cF845cWEpKpzQGuc1yQsoKT+tmkNOo
         878zot98QnyeQB7YprcZzf/ySsSKmV2FXwKxaEHR2dkuSdX70c9b6NFMvzITjJQFGICg
         A+T1gYBhmSJqutcI0zxgzkBvWhvcU/69XSWwfD2G/foAsK8gtSjJQxOmx6kKESsRq9W0
         sNQw==
X-Forwarded-Encrypted: i=1; AJvYcCV4X1AnyhSWsh0KmCk/p5ZA+m53yJrEYOD1NutzQOkQF8vdzbzttm8vtaYEHV104C3/cR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ55HtOCSRS0qBG+0O8nIKAuW28hbXO69GC1l8bUxl9k7KLCQx
	+X3CSlxVlthFjFM5A9IXScWRHwxjpMZmGuXM6Nv8zwKkl+OoUDz/q08ntjNPExRAW9IUpq8KbL4
	UoX1UOnR1mZZ/x5D7WcByqnhwCp0=
X-Google-Smtp-Source: AGHT+IHFfyUv0ZEnCDnC4iFFwHVQ8zCLg2njN2QqtDJKhkZx735DkXAfXdqtX62YUB5hiMm9blrR4h2+RXFEYRQA6SQ=
X-Received: by 2002:a05:6402:2110:b0:5bb:9ae0:4a48 with SMTP id
 4fb4d7f45d1cf-5c089158dabmr854262a12.5.1724400691451; Fri, 23 Aug 2024
 01:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com> <20240822-imx_rproc-v3-2-6d943723945d@nxp.com>
In-Reply-To: <20240822-imx_rproc-v3-2-6d943723945d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 23 Aug 2024 11:12:20 +0300
Message-ID: <CAEnQRZD8sEAZ94W3qawxgb=31C-XGGg29L9WRKmdzqjYkxT6uQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: imx_rproc: Add support for poweroff
 and reboot
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 4:40=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> On some NXP platforms (e.g i.MX7ULP) the poweroff and reboot operations
> are done via a separate remote core.
>
> Typically Linux needs to send a message to the remote core and requests
> for poweroff or reboot.
>
> By default the communication between Linux core and the remote core is
> is done via a blocking mailbox mechanism but Linux doesn't allow blocking
> operations in the system off (reboot, power off) handlers.
>
> So, we need to make sure the mailbox message send operations do not block
> for this specific operations. Fortunately, Linux allows us to register
> handlers that are called in preparation of the system off operations.
>
> Thus, before carrying the power off or reboot preparations, just destroy
> the existing mailboxes and create them as non-blocking.
>
> Note that power off and restart are totally different operations and are
> not complementary.
>
> We introduce a new flag in the imx remoteproc per device data which tells
> us when a device needs this special setup. For now, only imx7ulp needs it=
.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
