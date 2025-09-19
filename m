Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35031E8AD
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297512; cv=none; b=pEjt+/QekaFieb4c6HWX7pI8AL5oAMZr6jvdcwKL7O4kij7OmeIXI6AykKqd3zC/6HzMoF8in1w7h7unPfttnWSXdq009tyvvy1XQ7k8WD8Plk2dFf16yDWkkjX5iWmI5WJzL8E2oJke64FGw9e0ilm33pGhVv4NeID05w7VFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297512; c=relaxed/simple;
	bh=NJnIJR+a01tiFVyycgg5z2jTHr11W/B75N+lse5oSTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1+ZGTQu3wzm65b3F9E+Iat8lFuWK6B69/st/j7gnsER6uV2FROxpKGvBXD5eeV54Uitx3bDNzO1ASpHjb6y+38uUIJbeA2EC/URKhhSQylldZSNieKHWJBWaIh3eh45PUxLlE1FOfwPV/VKTPekfAC+dvUnVhRBiPmB4pqk3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdN8wA2E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdN8wA2E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1945195f8f.2
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297508; x=1758902308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP5dGRqrdTptZhQQ4EtYFVr64j2KjS+2vfjCc+4QY94=;
        b=YdN8wA2EAROAknYp4OQ2Vr/wAHhRXYSPISZz6cOrroEIuRDPNrKlsVqpvgvUdLf4aM
         QJXXptwszYRYZIreecHRj5VMVwjBZqldSOQ2Dpo2jaHMQ1s22KkZZAz9SqM5HxuuPPSP
         ugmFKWGe1ReVataWEtGtaueRFe2pGPdk6k3HL4MQApXKE37amx8WGag5nwvdTyosd3BB
         z5e83/vxY86TUJDmQBWEfUZ8n+Gr9scmpDuMY+5mUbVHt/frftOb2FMuJGIdicS5AqqL
         pPw4xFgg7eJibYwI5bnFseYEpPBtDHz6yqxwTf6hhIsX0bpxX2yN4ggsTOsRVMqW6nLJ
         eFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297508; x=1758902308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP5dGRqrdTptZhQQ4EtYFVr64j2KjS+2vfjCc+4QY94=;
        b=KdVjhQNmXtUDVqU9i+Pv1E+qUOGa5w0s0AqOD/cZH53SgOdQPvdSQF9BS5u64LdX3F
         DLKvyxhxxNpmZDTM09IMBBxNBfNW5OhfRLgcZLUEUn8vjM/xDDP4D8m6DKjj7mcQVouV
         65v4DzksLuVowCsAKisRtYzdv3mPY6BgGbedljwuy8kUEqwgjYVdlOD6smyQZEsnuVGQ
         chUVo8z1EvZgL7CJ63ro4UEr9EBF7kWEZtUgzCPC/T6oiF7EN87g4RZGmEcBhj4yYrs9
         GdWjakafJSJ6JoUNrq7YResvBIzaroHWanHxRxJOR757i/0kGqo4WSipUyN5AxHOf3M4
         8tbg==
X-Forwarded-Encrypted: i=1; AJvYcCXiVKwiJzX13eKDBnf8XKHmkEyz7DUHAdI+po/v6zuxkT7UTMMHlnxs+GoxMw3mh/qjzAI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPzUW/btgxYcX5+MKUIAVsEDtfZWam+t71zO1HcbfOfR+VSEb+
	oHZua0OeaR27EpcGkl3Fef+5z1byi+e1JC2qLNb8bfrBHc/rpm+921E2RlJMdQygqW4=
X-Gm-Gg: ASbGnct5dRUmyEc+SiNeJmnfeV+YtP4SWWlTZGVFEMILhgNJH3S3U8eP1YV1phOFmNm
	Ob6MxhNpHOCkYi41p/Qv150ATkRKk0z/YDAB9oU+g8oOOcUykAuzq2QTYQ9awBui6vhFD5/s4Q+
	QApFGyqcGjDe0jGMx9CgpfOjMm1CdfMgCy5blQ6NM5fO1+w4aJEkQRXHJuKLVPr9KWGp8AwOnQj
	NT1Uof5pjO+dFSIci+aX7ozXSQ3U/YJgSn5SCbCjWQN8r/YlCXIqCWpwaNLxS6FMH228nb2Qs73
	EgXSyxay3OhJBTHWbgzITpXnX1GFoZisc1M+9kszJgkYVu7GF/gVHiK7zVoBhYCPEG3I2teYI43
	0omOS5U/1KFMvkNeFuqg+wuWiERdOQ/0=
X-Google-Smtp-Source: AGHT+IETzqsiuBysZBMfPLsmfeqemqt5Mwb8f51wHMHjVVo0pcnRoASq/BUs1RN16Mcn5F21Vi0GdQ==
X-Received: by 2002:a05:6000:144f:b0:3dc:ca9d:e3d7 with SMTP id ffacd0b85a97d-3ee7c92548amr2737996f8f.8.1758297508355;
        Fri, 19 Sep 2025 08:58:28 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:9dd0:62bf:d369:14ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407fa3sm8367224f8f.21.2025.09.19.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:58:27 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 3/3 v2] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Fri, 19 Sep 2025 17:58:21 +0200
Message-ID: <20250919155821.95334-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919155821.95334-1-vincent.guittot@linaro.org>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the s32g PCIe driver under the ARM/NXP S32G ARCHITECTURE entry.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..fa45862cb1ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3084,12 +3084,16 @@ R:	Chester Lin <chester62515@gmail.com>
 R:	Matthias Brugger <mbrugger@suse.com>
 R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
 F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/pci/controller/dwc/pci-s32g*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
+F:	include/linux/pcie/nxp-s32g-pcie-phy-submode.h
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.43.0

