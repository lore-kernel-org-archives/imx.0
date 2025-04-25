Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45C17C98
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 01:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546372; cv=none; b=mq9ynNXjy/a6wnE9CtFg1oEYnTo7467xAH/vh9jd5fFIQVNEjkaNPW0RkEYAihFWRtkItrSxsE3CZPZhrLq4SuRiCjRXqD5ZenUEhdIdVDG7B4bWS8DPbhscwx+3NSZWvaVt5sJCfB0vUFHSRZvRS1NbpEHgoN8M2/BoY5OJyYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546372; c=relaxed/simple;
	bh=1aJS5kl7xtX5V22+sHMIn3FQYVOQs0lFq8Rba+JOQOk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FxVr9LCsll0q2cpZ61CvqKAibwhHRGB5VbknQF0pfeEQKFXJoYiVaw6reeKqlmd8gelH21F8vPEwcQEyTGSb9td2Ct10ayjAZXkJjOmbntjnObgp3a+TptM4one22TmERBM+b6+zPrB3VaU/PW8GbKDT+QpeU5S86HcxyxkElV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXiDml/f; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXiDml/f"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af523f4511fso1580244a12.0
        for <imx@lists.linux.dev>; Thu, 24 Apr 2025 18:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745546370; x=1746151170; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=;
        b=VXiDml/fE2fOYdqtcCuLtVD+c4xJEbHNiOCPoO62nuCt7ViZwOvVPmc3fSPX19uj6e
         lfo2413O1bOAi+NMi+z/J59OlMr4wlnEtlw0wRUTH0nkWk7yJYOayZKsztkwhUCL2Fp3
         Msqnm4TvBby38XY21h8bEHBw4HYh94qh1ZG9TGyu9KBDv3Jpwx7iC3cwLyDlPTUQOxeM
         07gIaauvcG54Xy+0MY9FgFx96ZON+9XdeAyml4jayFBrmbWzMrUEW+r/C+/UUN2xeZVo
         GkCAQxDEgGzBfvocBwrR/98T61iqicJgFHFekMPaOiA43YD1V/8672jJJVhuy/rMiFsQ
         C3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745546370; x=1746151170;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=;
        b=HIOy6U8/rebE0aaXEKElgoWZBp+YBbHGkT77LYftFYpdqM7tn4tKIhik1AMDEEVAX4
         SrO27p0Gu0ttgTUoOz97CIbyZu45Z7lXcpDSTqr3BYjtu08Cns+b5uBRZHS4YFtWv3ld
         HLKgghErjjHd6rX+6JJKLSWNWen6jVP7vJsQ/7PkMpj9CCTqj0iC3SggdQ4ts1SYo1Wv
         v8IIwIzaXnVugrJqBOuGWhySkfFTc1XfSAVSJwr8BpoVxM/Ni9JSO5iaN/Y+2ptnf/re
         I++z88eInwTaypv2Lkw40EYEfm3tWHtAS/PaC5rEYeh0LlBMUA9kK0izkKxV8BpEMNHo
         19+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8bHx2bvz1J9r66yEYTi+EfboBPZbjVNZ8r9FjeJsFAXFURS3Bo5LfyQ2rrR+9ZEicES0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/kH/d/xJ6ytUKpm24/ZxyG/YUJDSTn5s+598dZvhacqRb7dF/
	t9T2Hv5wdQq2lfESBWzBbMUVOWeKWvuqBvwIzIMba9pFo1Vmcx41u3gpd2t831ztTwA2864mLrw
	WZVl8QHzRoI5/CoddHaXtdKXZ07s=
X-Gm-Gg: ASbGnctbtuFQias7fLMRup+oDVvvQwSVroO2jWMlkT0WkbQ92cmVzkcaK/u+EYi4cHA
	qFu1ESFOPCFEXJg0CLuC/fpEWkJEtRLSlB7B3N9QXj4cfKmQS5TGGsTrJEIqcR+Q3OVACeokFv0
	c9CALGQ0ikUrRTxAcGQr2V6418WcqgCaxr
X-Google-Smtp-Source: AGHT+IE+zVM4WpEuyOpPXj2HuMzgLGXY1M8RKFwF+Rhj/9AiRqxl6HW9J6mp5sKp80FFW5u/q6NHC6lDdZMUIYvZGBg=
X-Received: by 2002:a05:6a21:108f:b0:1f5:7e57:501c with SMTP id
 adf61e73a8af0-2045b9f2751mr579130637.39.1745546369927; Thu, 24 Apr 2025
 18:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Thu, 24 Apr 2025 20:59:18 -0500
X-Gm-Features: ATxdqUH2ucRW9Ou2xib10t4cq9PF3I2OJH1I9z5HZpvuCEak-7VO3uZSElmYo3w
Message-ID: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
Subject: i.MX8M Nano ISI Channel Question
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

NXP-

I am trying use Libcamera to capture video on an i.MX8M Nano.
(Hopefully, this makes Laurent smile)

I noticed that it has a maximum capture of 1080 lines when I query it
with Libcamera, but the same camera on the Mini can capture at higher
rates.  The multimedia overview states it can handle 1 unprocessed
camera stream at 4kp30 without scaling.  The Nano's Ref manual later
states that each processing channel has one line buffer, and each line
buffer can store up to 2048 pixels.  It continues to describe when
processing higher resolution images like 4k, the line buffer from
other channels can be combined.

Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
explicitly goes into detail on how to capture up to 4k image
resolution by combining channel 'n' with channel 'n+1' which implies
there are at least two channels.

Section 13.4.5.1 states the registers are dedicated for each channel
and spaced 64KB apart, but then the following table only shows the
base address for one, and Table 2-6 shows the ISI size is 64KB.

The driver is currently written to only support 1 channel.  When
reading through the driver, it appears to require one IRQ per channel,
so I looked through the Nano's IRQ table (7-1), and found there are
three:
ISI Camera Channel 0 Interrupt - 16
ISI Camera Channel 1 Interrupt - 42
ISI Camera Channel 2 Interrupt - 43

I attempted to enable a second channel by modifying the .num_channels
= 2 value in the driver, and I modified my device tree to assign a
second IRQ (42), but when I query the pipeline with libcamera, it
still doesn't show an available resolution ov 2592x1944 that is
supported by the camera and work on the Mini without the ISI system.

Can someone tell me how many channels are actually available, and
whether or not  4Kp30 video is really available on the Nano?

Thank you,

adam
