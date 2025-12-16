Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5169352936
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885766; cv=none; b=nEG5J3Iy+j8tKEdPncK2dHnCjdynl9YiXOKC/BpcYsuLxZsuiTZE+/5lkq2TPZCZc9zkOztaIhH13rumepTeNJ3p81tIu0UblK2JzgpKvEjmLufHRpVNi4xBCKvSm6F+YAEM3vOnAEbkh0mzXUKx6XUI3ziHKAIb8Pn73Dhs4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885766; c=relaxed/simple;
	bh=P3r5nPJCwq57O4gAEF8RXUKtm9lIBx2Lzztq/sylt38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fn16MPWxwMvQ4bFZct3bZDpYM3vCci25UgdchmJAQsyDesy+/gbd1yWRB68+t4hbhSASxfRkyBvT7Pb4jHw/81NuJbp6a3oTH0UeKRLbUIWpQngBe/e7DNab3SJuMPGjYOAo39c2DvvM9AD4DMILsAnq/aiXzG0pcIr/AP9rozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djezLVYX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djezLVYX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso2554981a12.1
        for <imx@lists.linux.dev>; Tue, 16 Dec 2025 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765885764; x=1766490564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=;
        b=djezLVYXcYG9Jgh7UGGO3tIm0EPnNa3jNl2jLGVzBFTZtMvHVGEDV4t/dM4k70BYu5
         AYQBqMPh9LT0HIq8/0vZ57orfnEozJy7crJR03FMcLTlXVpOhGW9LVFYFX6Cpn993eec
         CsusQSpCUEjH4aYfC2fguOWf6EAB8Lvtq9UwhIsIO6YlALJ2AQw8nl8BZ+RtbzDpJmpT
         6tLNc1YAoDXgABoGJn7gQWzKUUWobNTu97zpPbIxpQKGWhvBPtXhRkE/wAGzm4ogSjUp
         6UwAYkJjDS82/1molXW5mGWcE/CMJZmUMuS5OhE7PZqlYFHMFaJU6WEDy+Lg+H074Kcd
         U1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885764; x=1766490564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHWMHf/Niwek5OLfXdmD1/NkgvAHjqsNRHIl2ImUeLk=;
        b=CnLf0eofjU4YOLXn+BPYgn448klqHdH3WKaEy6HQHOsCyFmKouDuEL1WG4mA6B+46Z
         9y4HTRRGbtOqBPxZbKb0a+jk8i+KEeuI+gAC+9+hXztZazc/gd4gAbJ6SVKGii53VKCd
         Dxut5zE500wiYRub0AriDbIHmoRM9VMaj4PupEX5DS3+Y9pypEt3Q0r1YjA9VlQsZrX9
         4J+1ZjqIlkrd4SmMcdSFxvG2EaBHSR3N5AFKTBBtfMQrpnyJdbV3nQSCMWgWlG7kZZEs
         2YxK5ddc2g+KsvYRaAKqZaIdV6Q/LWCBkIBhOLMOMibQjrDNcmQ8BgYGUBuFtxrz3B3c
         3xqg==
X-Forwarded-Encrypted: i=1; AJvYcCXESMCG+3tBsQPUTSBVClHc39ufMt5DtGjKylGe4btgKpmM7VZu7wLWjkK+C6Llas5VTM4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdw5Yb8jvY2lM6ZLjccwFnoEx37ES6G2w38UT2fHQ/ebTFk1qV
	jDDowBW+ebtCrLQbmv1TzcvMDpqsiEFoi4ZYU4u2JpfNP8eN6+7dajoYi5uKWOlB9TUO+xu6i+u
	LT3hPcRZOwq9MNmGh7kquqtH8EzVUG3w=
X-Gm-Gg: AY/fxX5YIZ6ZkopUz/LkCLUz6vXMWGYJcoxOaKBTqyhgqvKkV3mho/ny4G0WRxkis46
	FXydd5u60f4lkmkgTnODp++MN7PZiZp1DR0/ZQ/znjRkta/6bajQr6uHrICHKGPnN3e5jkLfoOc
	ygirNmLFLohrYg/+1E3WEttmKyAD0f+32qpYWq01EONdo7uoxbrpREhFUb+Ln8BnQJ3kMj/Gu29
	9IF/dV+aWYQtbyInjRESHrPH0Hmdh7ZlYEp+KAF9wZ0DOZxZYg0n7UuS3QCyFaZpcG8rskzXgzi
	QIVFvWPYaZ9+Q2h6VytOb/1/tYmp8SOZKGvbcAT6zgaFoAEw5ax+/j2nV+4mX6s/8xohmbKm0GJ
	bbtzdu65mlA==
X-Google-Smtp-Source: AGHT+IHPEep5dtYauknDb8YyMm1kDWolPZTnV2HvftVKII1DWWjGIN4YN/9xsVgqVLYIfLemujNO/0Bup29BPcFhFqI=
X-Received: by 2002:a05:701b:2415:b0:119:e56b:98a4 with SMTP id
 a92af1059eb24-11f349c583amr8528888c88.11.1765885764035; Tue, 16 Dec 2025
 03:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com> <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Dec 2025 13:51:55 +0200
X-Gm-Features: AQt7F2r5R94-pfKGDYvFfrkyngEDJyIru0ByBqDzhFtMH5nZZaARnweMqygnu0M
Message-ID: <CAEnQRZBS7zzc9AmTymCGVKwExeZ-JNFiG9MamWOZmk=gXdBY7w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:53=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control i=
t
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whethe=
r
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
