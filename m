Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615252;
	b=OfPZV9RchsmKcB/PvtssKtlEN8Rbk7z+UNpwnLJZiS3KndpdAH6MFFobYWgVM89OKrmO
	 v9RuKnrjOskYr5bq/9Lbp+P/pzNWdgjiY9hzX15e5C3IMzPSRaxI7gJ4zICnyaNsix2Qf
	 Q+q1njHKG4fvCNmd6la5/5bwLO1jwSSU25CaQDdyWv+t+S97vgfavV/6ozJQWibzzW5rb
	 HAAhiWGtdbiL2ImTiOGRJWKoukrAWQJahHtZ1sfuNzzCbNamQ+h6gUfdNNqvkJ3ohoVH9
	 14NG8NVt2g30p2go/KG0g5Cvfd/7NNkCQXS3UvWZaN5OcLnMoAwjiOvkzLFdjwK3mEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
	b=GDVsEDFpWnAgfhHnAL0XvwMhbGuRWRrLdP/9iC0N/mpKRaiYSdO7WeAt50E/hJojHs1z
	 st2Hw7IZRxf9ATCMSimSxGTayKE56/CRgT39QFimzJHOXMsf/Lb9DC0qhn571y+jItWsN
	 W45pFBQxYExP+RnJSiueJpPeYdUqN4Tmo+D4+A5FfoUqfe0/jBm9QtpnSQWRF21s9u2RV
	 hxpEOcbSPrKzFHF2q0RK35TtYtSZqnILLvZ5FvQ6u2rUxP2a/9P6qOSUO62pX0plhx6Fd
	 K8zmojTypt84iefyGyUjCdskmBghlW7gxstFTAd3VWf52PTxVMrIpovjZhKPdfTryXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcLY2z+G;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC8606A329
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 10:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CC8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcLY2z+G
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so5315125eec.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 02:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615251; x=1794220051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
        b=KcLY2z+GhMEconypTOQr2vdqi/q1KDxjY02ZQuG/F55Z4pKJ3JG5GXABDvEoHhjIcr
         XFDcga0KFhLLQEIA2T6jjLv8f8Ndb+B7FfcIywL7IFHNeW2b9HSYJjzreJOiwYmx1tXQ
         9AbOiKRH7CLNXCYx2GUDm/oqmub09ScekBHrbh6qqkdGPYITbR+mzkCMpwkHIglfQu6w
         vHRvqEBTDmIuovMJ80VPJgKRvDaqBQanBWsAAHCeKmq8UpUUmljgb2loed+O62AYqusK
         iO7yMF9gjWtmoTwyAE5XzyO8GWaHvoEQNQ1q1WSHew6mOhWl2BOsyGMIn0yvl+F6WHEh
         Lc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615251; x=1794220051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
        b=ZSBwr5rJIbTJwCWcGpa22zaEnTFYK7C0wOGCvi5ckh6C06+r8UQoOUr5EFzsMxmfJn
         xtVEUyCZOnEmts1WFU/BATAVxkIMALW3wR5HcdaevzVekPyH4W3P1GfxTdzfyIKqVYpO
         50JkMAlsUtFhzcK9OTnJth651gJWPvTn36PBBURWY35BCzLNU0kdNfyprz5rbe9BF86n
         H9b8TT4pPutPmoWvYr5SMCvfHlYtBKAuMlpxEL28fUHM4rMPvxLD4iRLX3uRTYpt0u80
         nHaopyCH6HVXO02PnODv+mY/gbUvSufeCD+hp6qOD27kW9JGwMMZ+yN4QLm2c0BJ8/s6
         Miqg==
X-Gm-Message-State: AFq9FYJ6+JZpC9ghpn5ksNkp+722irccqP+NhWtgEpclWlh8X1jM6wOh
	CuzJrck1yPh/IvezQWo0uJl+WZAjMya4Wxdmdw+XPKOlTpDx0j1BO4xG
X-Gm-Gg: AYBFou3blbeieBkJanrQPmlUbilAvhOnfhhAN2yLuHIibr8ZQTHJGJ5RsqwEJK2D6PF
	e+h5x9rKbSJVGBuWWsfKtPHcrD31FartK3OeLdk9RFPupcN9Irb7VQwJQZmrovqD/XZz4a5ZSj7
	tUkxAMCF8wqsJk+S+RqXEV4C9tRmufYdLx6us3wJErkNcmg1JjzfNdbB6NeDpeAlfeMJqab6pgg
	NQS4K8d/1DaenpbOXwwePSEpv5HS6tjC5Nnxz7lALud/fF+DEQzjmQwlzAYyeEHRP13H4UMw77X
	67GkhxzrfIiinu9/OGF/8cipfP9BENjWgAKdvxL+WgwVauGiv5yK8kJ68GrQV7cVLlZKbI2NzA3
	dCIt/St/Lw19EjpWY3m8l/UOOxpWSQqrae+5CmkIEvR1rDkyp0dEAbcbdjv3IUjmVRiJMdEFdIc
	qTApkmKEEE7kqbtntOom7CV3LAq/Bx/1/E7RgXni/7yt53lNbnoXgzL5SezlgWaNzXtLIUK1O4x
	37YM/y/fryH/z5rGfRIsz8fEQ8CiPlA2ZB2r+pyQ90NEpdqyG1x9WjBhQxMcrbKTTGuiLIHugp8
	304xtNYITdKofv6pojnT7Ihk4Ee/DIeGuQ2MQwWht+g=
X-Received: by 2002:a05:7022:f409:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1ac5bda5860mr20263781c88.22.1793615250911;
        Mon, 02 Nov 2026 02:27:30 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:30 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 0/3] Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 15:56:50 +0530
Message-Id: <20261102102653.272056-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102065645.121046-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the ADLINK LEC-iMX95
module on the I-Pi SMARC Plus carrier board.

The series includes:

 - Add the ADLINK vendor prefix to vendor-prefixes.yaml.

 - Add the ADLINK LEC-iMX95 compatible strings to the Freescale
   i.MX device tree binding.

 - Add the common device tree description for the LEC-iMX95 module.

 - Add the I-Pi SMARC Plus carrier board device tree.

The module device tree describes the onboard peripherals and interfaces,
while the carrier board device tree describes the carrier-specific
hardware connections.

The device tree has been compiled and validated using DT schema checks.

Changes in v2:

 - Add the ADLINK vendor prefix to vendor-prefixes.yaml.

 - Move the ADLINK compatible entry before PHYTEC in alphabetical order.

 - Enable open-drain configuration for LPI2C8 SCL and SDA pins.

Hardware: ADLINK LEC-iMX95
Carrier board: I-Pi SMARC Plus
SoC: NXP i.MX95

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 5 files changed, 660 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1

