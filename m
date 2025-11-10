Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B5D2DAFB5
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796026; cv=none; b=nqBKIAwkEQQ5kv9duv3fh/706PHYgef4vhYDNL41qnbmbx93aQWv7TTC05LOniUch5blFHsv6+GSr5CQYqz16BvgAX36gTeMEMqJ5XMOucQCn2x9tvUZ5XNX0dLirD2xTBwY7COVpyUoYXYGaJUr3M8RSzlTjIkLQk/BOP41HLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796026; c=relaxed/simple;
	bh=DtKMJowc8zPPK7iC/rmKldEQoigsxp57cIpDSZGk6rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcBBxvvV6t+n0VMOctFbZKhFwpA3WkQCNsjZlSBMiK2wt2lMoWggK/OhaTYOaIbK4deQV7nm5JeT7OvYjCT9GVwmqf7Lr9AzghEyu68u6J4jMibgCXCCr9jP5Fj8RHgQVcfP0Ew/zkir8+9BOlJiSzkEgWYSU7/GB0pOhZGY/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XyCBLKId; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XyCBLKId"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so39290265e9.1
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796022; x=1763400822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWzPWemnSbElAjabzmde4Itt9ehqptnppmUVmOqIRpI=;
        b=XyCBLKIdtP3cDRifBhS90Bksf1M6CA1/IkoLcU33RK1IWEg737/SPaXxJGaR6Wy8qM
         SxjWsr097E1lMlZsYy1fchXOl8Y3dPwqVoAikaCYXciq9MIoOzutgmJr+cMBzySepZqV
         tvaRmpltvEp5Ivw4wnNtsQjyPC6b5f5PnMJsa4fES4tMcSJAhtG30B+sHcBQkt6vgUuf
         wVQqxJYsv2g+wbmGFq12f8/R+Nwksn3lnZsfq6kZKdkuMFU1swSiBL9ZUt3aehbSDdVc
         8i2dHeS3dG6k/BA99UonvVnPpjYEFwU9bqiPfn8eVo92w+pwR5Ui1rxmpiN/BdUskebG
         ElUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796022; x=1763400822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWzPWemnSbElAjabzmde4Itt9ehqptnppmUVmOqIRpI=;
        b=sT+URcN/En0T37nDdSs6WIIe6YvziRm6qJ1WGpZ7KLy2SFjw5oGq9lBNLToz8pDEbF
         tQ7mDlf85AC17v2zAvarSg6C/lo4QgrBb+DBWhOYz2kYaqAFEYrkYuHQo2+O7l+suNuk
         vUaDXq1sMwyIY89MnNR5ug6QBPvpClE0+H+JT9yGiPwbS3wOx5kp5O7ZCyAgdtVG5M+o
         8lyFb0Z6MJq1eBpTQiF6fjcyPcD3Ggd+XDlTOC0r/aKOHELHG2MK1mwQqtDHP2N5C+my
         SbwoEMG7tkFCkVUwKUKOl7qogDLc+GIoWidMLL1RAoq0iweW753M2U4Mj5zBVX8MyDrj
         n/4A==
X-Forwarded-Encrypted: i=1; AJvYcCXUG4vX3JKo10Ey/ZXjm9xHbkg3sTa7/esz3fB4Jyx5vbWJGLc7MTfw/QiW5buNbybyunM=@lists.linux.dev
X-Gm-Message-State: AOJu0YysvvLxw5CA8PNa6GKHgi23ytNWYlrunhHOY/rqfpOKSiFwf3gW
	Ll9u7FOpB8DMPwKgfF87SzF8a2GeWjuTe3j+7i3oAd5FxtbAw+tCrUN0Uvl+aX3Wqrc=
X-Gm-Gg: ASbGncuwtXgDD0AzZuitck53IPWGmd7HFkxNesR+wtyltxij2nD2beqTSO48dQCx6yX
	WOTJ8IzSSfvAKDJIry16BiC8CdtucjxLZwH7p8Ae7LVO5sJVTiknILIK0i268Is2ita8t9XYSoY
	uHeMiNM2a3ksVjyOTjCYSQtiYKxAnScjRChAZ/bUXV9hjIyRY2Z1PlIo68LUwlclyhRfeNsxIlS
	6ieAzMKN+Y4Z1onQUhI52PHVcd3EItV3hgYBRxwwbhn3TlliM466m2UFIpr7n3eB1CiBb/NdMT+
	9G/CI4IkdvvteyFE2bqjPzCqQvWOq4SWbhQ+XtMLdO/iOfFfhOjHNelsBY6YgfjDxSj6rvDoTDr
	cgv1PIFWAut4N900T1M2Xmabnqpap2wjUajRR3MkYPhaVETiz9qWBrWujoj8F5Caqprsvl5L5iM
	vlM8JjjOBOKL8oN7aSVvw=
X-Google-Smtp-Source: AGHT+IFG+zeZs8i0HcOK4EFCqMFXkt25jlhJO9xhRAVgjZV+KV4HEsFl6cEM5lLjaVjHEaqSmZ4BKg==
X-Received: by 2002:a05:600c:530f:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-47773465f2amr89513515e9.7.1762796022324;
        Mon, 10 Nov 2025 09:33:42 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:40 -0800 (PST)
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
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 4/4 v4] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Mon, 10 Nov 2025 18:33:34 +0100
Message-ID: <20251110173334.234303-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110173334.234303-1-vincent.guittot@linaro.org>
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..922ebd4787fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3136,6 +3136,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
+ARM/NXP S32G PCIE CONTROLLER DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
-- 
2.43.0

