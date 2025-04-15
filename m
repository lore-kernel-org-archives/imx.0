Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0F24EAB1
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702729; cv=none; b=rC77ZeEVkos4EPzqUtg2eg8FypIsDKdaSOQeCsBz+CGDDBV1CeTe6rZgt0Td0mfkteA9qrOGs0292f7f8u36HxRxtKl+v58eQ51rvaGmyJdzoq097dejHxUWpSd4EzGlzXt+qG5y7RqL2mZ9SoZt4M44PZpwqe8AFk/xcgjb2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702729; c=relaxed/simple;
	bh=jEhRmyM7xjK7MwkhrtbB2WCd9TBaFxjOFcI9QJeE3qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXkhXqTwMJ3RJB89Zagfs+H+onbF6DC2OXT1VvdhZiObGImDEFOFHhSrAIZtt3Jb8KswB0OynkZY7zfNg6u4KQrnzx6Se123QmWhDgfe0slS+BH2xrNBpEpsdAF7bTlZxyQmBEwdUDJnGSDSlCIbK7JdYpAoVdqNMoLLdEQfer8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT/Pb3p+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT/Pb3p+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so6517373a91.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744702727; x=1745307527; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=;
        b=HT/Pb3p+EvJNTacvAMmaWDZmBGdxKPNQ+2khVXGwdxxm8H2XqX6Us/2EW6nqaHn6Ly
         nGI7/ijT1Rakew60UyBZ7jWDNDCa/XU0aIQ2m8n4ZBzIpRL1YU08SdbxZ3D9N/Xe0Mxc
         FP4Ko3P9q5jcXVfQfvRocuhISoUNahPQKNi0KjWB2mi4t29VrTLdk6nUAJil3U4evAtL
         +G9cdxuk8DqUua1uOBAV06acH9NFeLIBUjSPqbMaSpWPmYhI7nn1bQb6+MsxZlkgwGtx
         gES5ebWWMCEbghDo2l97PfcU2gr0pkui0xBeVLuxV13AgxXV1QxDHRfC5UVZvIImsz+9
         Uk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702727; x=1745307527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=;
        b=O9PaIydFX51X4z4TdG9qhrvd7Oo8eyWHe4ocNvyjaqQxnkiDXfmwcX7rjwR9ssLwyC
         H6qTZe9o4TZjctu9sh+AAC6J6SzU5mnTQ7uaBQNlMzQp/xfQgxW9gSmXAZ1DR4DwI3kW
         JHCYSshSgwuoQwazaYMpUBDa7r5qeeUxFLYwrR0MUk3mbHYBfLAmMGM+jK0wNxjk7FLW
         dm2r6CraV9s09MIEvxv7urNWvdzyt7eMqXYgCC40KckRTTnHlzHLanWd5QriWq/j++Wk
         qAN2dJYV8+fqumhlMvne69yGLU6A4o+iXQ0HQ7+ergPb8YJXB058mMwJI64m+IykK5V0
         dKow==
X-Forwarded-Encrypted: i=1; AJvYcCXmLOGvFqA9EI9sZgb73wjDVe1qKuibNwdR39voKldpU+H0eFFIk45ZBKwfa4P1QgJF2cU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0uqhV9LbigQ9A2MWPBzPMGu3ze37+2gvfVkAwav1vh3zrMz3I
	yDl29AuUM3+fG0ZPjsiMSOgZsud4Sgsm38yRSbybeO7mtEr3NG0HpEOo4Gd8ajwJPme/YzbaK0+
	Hy2cYcYTTYiU4rN3eJ6iIsiQptv4=
X-Gm-Gg: ASbGncudKLJghKbnydja5Bn7MfN/Oce4S49G01mq7wRzH7uFF0XWc2ecwP5WrHwqeeE
	1Rud3Ynkmorpw60Sn0bh7K14sJCUxmspDmmmbz150QVNOGHxZ2sVnOIvlzZYKFSONxsiAftRtY+
	DnUfi9mLLcE0AAZOEHZw==
X-Google-Smtp-Source: AGHT+IEaQw1fMF+aLm6pFlRnZGVkYepFCANlU8kbPs9GBkc7bc76oOvq8qIgGhVqNudolyAIqZhr3iUCEwZKISUsLJM=
X-Received: by 2002:a17:90b:524f:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-3082367f7b5mr25807985a91.33.1744702727316; Tue, 15 Apr 2025
 00:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 10:40:32 +0300
X-Gm-Features: ATxdqUHIjcegsRqkaCNjdC-btbkENgkxvRanbyOKxKHVbD_D9EvsKEww42I_CYM
Message-ID: <CAEnQRZBFoZuiFJtzs0wCjrHJro3c=fWshRogNBnfGmkeyh-LtA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	frank.li@nxp.com, aisheng.dong@nxp.com, laurentiu.mihalcea@nxp.com, 
	shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, 
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Gentle ping.


On Thu, Mar 20, 2025 at 2:08=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
>
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
>
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
>
> This patch series configures and enables dsp node to be used with rproc.
>
> Changes since v6:
>         - addressed Alexander Stein comments
>         - enable mu2 separately in patch 5/5
>         - put "status" always as the last in node definition
>
> Changes since v5:
>        - do not enable mu2 node by default
>        - fix dt_bindings errors
>
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precisio=
n-Tower-5810/T/)=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7
>        - after comments received on v4, we implemented the run/stall
>          bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/2025031108581=
2.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
>        - picked up patch related to using run_stall via reset
>          controller API.
>
>
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 29 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>
