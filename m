Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5C205E1C
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351599; cv=none; b=NCjSlnOSYmwSByXwkSmM597FPCuYmuf1ANtwZxwO1BDuh1VcOCA2OBBkVT9XlQZBqf2mb7zntq+mWEeSMb0lw9+QjD+5IIkALvrwTQC86/YozqLlHvfhLQp5xa/eAvRGPKd9VA1kY+XKQJSLpwikOjINy2/8ObqQFckFBgvNPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351599; c=relaxed/simple;
	bh=aPD5rYa5UTZEA5lzkKURim7OANCmr8pHXI0PnX7mAMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0Bj9YGCseDffP9iJWtqT8XLgI4IB8jM8n82wot4Idmov6b5T/RfcSVOYt/fdpby1mG7Jd8gv0Zbvs1VVQVMHB5q9L5r2br5Ft0kyScyk+M/7p3LF4eVn7FVCSYzIS7mPr9hzE04rbjjT76r0wD+Ftt2CHIJ47d1e6iXMAISrko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrvZX5el; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrvZX5el"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so4962063a91.1
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 01:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739351597; x=1739956397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPD5rYa5UTZEA5lzkKURim7OANCmr8pHXI0PnX7mAMw=;
        b=IrvZX5elQ5uFEkj00FneMHk2jamGvDgrRCVe7KMAzp3fNyhsdJ9z8IrO40twY/BFk6
         qcWSMIr4E3iW7DaCOoBUsbJyB21q5W3nuxcHfwE19rTSBhm9iKunaj0eaOCsebPEDtdM
         8kVwkguo2n4ds8SEXqzp7byXYq0IuiMavACZMwMXqHwN1zGccQLx39DMnyM1y5h4vJ3m
         6jT4UmbIYxFKsG9G4LQuQmeWQ3SgTxWPkoeFTwILiYueuIZliD6jnpBuSsoUGud8YfjN
         CWPF0DXIhA/4YGaMQhgCqrJXnROIGOT58NHo0K5maGtRGNiH/cKcDbCEQoY5BnSOwzIQ
         n+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739351597; x=1739956397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPD5rYa5UTZEA5lzkKURim7OANCmr8pHXI0PnX7mAMw=;
        b=Q2VG3m+Yio5iN5AKnD59BCIL5IzJOmnso0DkCZ80lVMs34zf1TjLuQSqBkSBVW7a6V
         LcfhVcRFUinVnJHDOL8r/NiiRaC0yneUrbtXXd+vbiKX/qNpbECiHX1K6a3EWG/lKAUr
         e5unJguYO3jzVpuSx6T/otpsO5Q9koig8iKUjwJ7ik7qR7RO9dkcOT5dsG9tcioEImmz
         4XwudxzIomlzD2WrcVBDgHZ1K3Bt7f6Xny8SS0Cbkr4xDbGg1mpn5mftcmbers7Wbpuu
         M0jTS+08xtWbCGBR34662x+Chck06g7rVrvqa7wCrHFPpIW3gTUenIT/HQYhPodTQ2D8
         FGkg==
X-Forwarded-Encrypted: i=1; AJvYcCXl5fHwlFSL82QEzN36fvCwciSgQVEcl56yioAr7Pv1ILM7YCJfszA3toZ77yGtxI1DKRI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU26U2rkA1A/B1x3itgbwzYJG9ftAhkbz1z8HztYoT0c3MqhMe
	U3oLJkr24iqzSgPcTpgEwW4BT8r/9PFtFG/8OCFRxb4ujUq2LXeJR2c599JqrSSpe3ZqftDKkM4
	oWHTUAxqRkClFerJmiTUxUjIx5Qs=
X-Gm-Gg: ASbGncshzoDHr65mM0XopyXNaFVqVfNkbTuagfSKATS/vikX+aozn643J+womufnRsz
	+bww2HJle7uzwyMmbyiLmR4Xc29VTkKyDdp8QQWt7f2pmwrzjkUZPMTlx8ynRtbX8EvTStQ==
X-Google-Smtp-Source: AGHT+IHT+ZeidzgbuFPK1T7nat9jcZS+nvvNOTSUNTmWCKgY4f8d3bPZ9z+vTH8FvkV4Hugvz68ajXpWP20x9T9YFVQ=
X-Received: by 2002:a17:90b:2c84:b0:2ea:7cd5:4ad6 with SMTP id
 98e67ed59e1d1-2fbf5c71362mr3494611a91.32.1739351596956; Wed, 12 Feb 2025
 01:13:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
 <20241210125338.104959-6-daniel.baluta@nxp.com> <l3z3mu5inmfc23v4mymtcb4gnzic5zupqfpcuk7vqeweluy5jn@c2b5ex4lkdgc>
In-Reply-To: <l3z3mu5inmfc23v4mymtcb4gnzic5zupqfpcuk7vqeweluy5jn@c2b5ex4lkdgc>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Feb 2025 11:14:50 +0200
X-Gm-Features: AWEUYZlmAF9HL7F1Di0jk-WkuyiQ4SgROYkfG9zP3ZC-TaPsUodPXn0I9h7DQYQ
Message-ID: <CAEnQRZDZSj2tkMzaqZfaO0e8drO3U2j_qxoZSNocAS1Qaq1Q-Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, 
	a.fatoum@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Dec 10, 2024 at 02:53:37PM +0200, Daniel Baluta wrote:
> > Audio block control contains a set of registers some of them used for
> > DSP configuration.
> >
> > Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those
> > registers in order to control the operations of the DSP (e.g for
> > start, reset, etc).
>
> This should have been implemented as reset controller, not syscon. It's
> really poor choice to call everything syscon. It does not scale, does
> not provide you runtime PM or probe ordering (device links). Quick look
> at your drivers suggest that you have exacvtly that problems.

Hi Krzysztof,

The bits we are using from audio-blck-ctrl for controlling the DSP are
not for reset!
They are only for Run/Stall the DSP.

The reset is done via DAP interface. I will sent a separate patch to abstra=
ct
the reset interaction using a reset controller. But for Run/Stall bits we n=
eed
to use a syscon.

thanks,
Daniel.
