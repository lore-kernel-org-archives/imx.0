Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DB296730
	for <imx@lists.linux.dev>; Thu, 15 May 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304354; cv=none; b=QwyDk53C6EPb+0f7+dAgZSG2bZEHfHpiFnXlSZjkaOmt9HU5EIfaB4MMG/KGBU+gI0uXm7nspXIQ4R2tOOvcXAS2GOzbNbH13RNNKwgNAftKJT6UzmdcTq87o5Fme9+tPvQj5jNUJCKCmh5Ub1ajHXJhOC3AGf3tRmsC/z++rXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304354; c=relaxed/simple;
	bh=/cnbovOFj/4K/kSKZHZsimOqCSA+C4agdVHxhrxUPSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJ5jX5W/ftAy4zLazAtqQBnhJgycKrH2D5isNUnNPXH52O1AOjeVHS8w6WlMT4k0Pbyv9nbMTUK00ZcAP/B9cDznvPVq5AWoXAQFHV8ClYmWYtiz3YC3uJn8JMWuqOc73zDsPn61BULP4OYdi4DZnW99f0T+UEdI6Toh3ktfnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCZkqaEE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCZkqaEE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e7eff58a0so7766935ad.3
        for <imx@lists.linux.dev>; Thu, 15 May 2025 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304352; x=1747909152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=;
        b=FCZkqaEEj/4p45OzZWjO6BUb6P0EsMCEb0GA+z7yHGKFKuXZ1J1hzrLtEGl4YhpE35
         KdcrbDCIXp5NQ58HvbizYtk1OTst/Emya/YcAg5YOngGhgZRY1D0lCyTKTos3ZNl6EKb
         7AtMk79lDFgdUeq5H/FfeLDLm2j/JH9/twWN+zM1yHWVJFeYdHTWXqeGLvLolO6yuc/R
         QW7RMYXUeuQQoeiuXTcN6Fh+JLS3orXmSkSwfzpXnCkKo3CSFlJXEG9uLEGG6oQfv6mL
         PqIBU2xMvAJy+iHYM4dlTm/x4sC4FcjS6l/ZM7GmJ5gFCPI6puxwog360Ju8PtHe/zxx
         oKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304352; x=1747909152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=;
        b=ho294zUHsDCuNx7rx3a3PadCqN1hiaQFuxYAtvbmH8RZDCr8vfWYV1bpWvFe425FOq
         JFNrhBlymPjbM9/Kywtb4VXxShtQ1SMVo6EEeaBgYfvnNHJ9y9KHnY3dQmHLtAx3FHqm
         DftKGLUg77VoNCrATq7hufcK4v/Xy3pIWwbmhaX94Z5YKgWndL7yjswO0Kznl3ZKRc0c
         QDJuimB3kBGn12doAmkTZRm8dU/EJ6B55Yf7WqE19k6QFy8FILAPGuucrR4y8lnYpKQJ
         TNjLtK1gIBwD9AVJPNlTKhe+yBx/CnLDh+zh9rvY1Lb3GYszZ6YSmgB6AqevFiFHfFdy
         l12Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7lKQ+t3nawRcXvuKY6uXCm5CoP4riq8SeHnp5s//25dlvz3j/u6C65QJzBTF0SWLHTkk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8rfn/p8VQFjItIFqXsMj9MBRuQKnJ9w3koVBYBKb8gLSuRYyN
	jWZDtnQjCFR1QzYnUKm6rhn5M/55CnzJr9pwrLOmXIbpnVLuQaUdfISyBCkkqxoO4onHFbh952d
	LMI5Sp1sX1wexbRYDUqpqtTwBvE4=
X-Gm-Gg: ASbGncuLWxZ1GsROMI+TmxO0NT0Nu4TZmIjFy94/7ia7VASKkrLxSyvvFOtBqezX5bS
	kSBJ81KLusBLPBqPCWExAIXvPyVmA+k0IFHUDC/UMb2o7ZHOnZWzXsII2Gbw7SFpieVyuW1Z9LB
	5tr7MjYd85ytAgCq+FcxmDAzYiSTMvzA==
X-Google-Smtp-Source: AGHT+IEsIUOtHqCyd3RUFAmp28tpSkSzHX7erUjCawa8T/wazwsdJ3+WuKQBWkKpBGFc9cg7xp3+86p/M24KmPAv1WQ=
X-Received: by 2002:a17:902:da81:b0:22f:b6d6:2737 with SMTP id
 d9443c01a7336-231b5e51d4emr26927485ad.10.1747304351996; Thu, 15 May 2025
 03:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com> <20250515051900.2353627-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250515051900.2353627-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 May 2025 13:21:00 +0300
X-Gm-Features: AX0GCFtYRGBFzwrIv-5BkoOX-4f7j8QWlxzR2F9_CR7P2Wf-QEkia7AjZk42Z20
Message-ID: <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 8:21=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add micfil and mqs device nodes
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/d=
ts/freescale/imx94.dtsi
> index 3661ea48d7d2..77297dde5c95 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
>                 };
>         };
>
> +       mqs1: mqs1 {
> +               compatible =3D "fsl,imx943-aonmix-mqs";
> +               status =3D "disabled";
> +       };
> +
> +       mqs2: mqs2 {
> +               compatible =3D "fsl,imx943-wakeupmix-mqs";
> +               status =3D "disabled";
> +       };

Node names should be somehow generic.

So here, we need to have something like:

mqs1: mqs@<ip_addr>

similar for mqs2.
