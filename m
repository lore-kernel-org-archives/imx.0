Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992965;
	b=jOGrNE1BHZxIvyg7tlKQCIEFbQyr+Mp45GCbx+nRAGIQjCcfIoO63KxjcI6lHZK41bDN
	 7dB5KolEGTb8W3dpOMAeC3Ffu4meRXy3hcHtDGGH5vXzN7hfPd/xWSdaBBmVH2+8KCuvK
	 GeQsj0CzorgYEdXbizz75QD0J/pn2eaUz8H/A8iw2Mq6OlaD+cwml3lcYgCw8p/4DDOCh
	 g0Au0SY3ioEUrLbjKdmIkUKHo7kbSiUOit5eONuBeKM6Ssw30nPl4qKa1fwuwKWXym9nx
	 AicGPXb1c/b8N/lIxvnjxEzeDnWjtNJtvedYf++tdtaGLjkDvi+KhzQsjtsJ3kqE1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=VT6wEHCSCTn79dE20/6SvVXVyYIvjbXSGYh1pkeJw5wSLk1dNfTIytlBmQR53uJDJMBo
	 bHZJ+XoSbjJyr5MuYLnsOw8YTpAYCcmdwLVmV9EjUE8zpbhsR3p8hVXEkzObPokdeUlhE
	 bBXwoYgucZB538WQzVfd3wzfpmLJcWEB1ILbU8/Tk0HEu7a6duUg8JfYrhEKCXrcSpltV
	 cNT5e0Qc5Z0NCvlfL0DOOBeRJyl0zU6NjE5spQPia3SDVo+QTfszh+Z0QGvBTZ7Ni0hI7
	 EflUryU9DW7+Ho0RS5Hz0PU+0Z0NOlYpzdmzwhU1aTM2UCzSGA3uHMzrbJvZaO74zWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=fFWtNCfa;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB5A606A338
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 09:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB5A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=fFWtNCfa
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4558325e9.2
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992963; x=1795597763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=fFWtNCfaooHdsh+/ii5dPxFkAPyVtXwyYpmM6LRjWJxue7sSo7nCPOQDi5W5aXtxxb
         6tEM7k6D1LNnNdAiecb86o/YoqC45MtlLMdNdVUtpFM+qXEs/csyhnq8B4Pb7FfkaGlV
         Wr50R7ZhAdtQ+P7SdFY5eRvqyq6OD9zs2571k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992963; x=1795597763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=TPAOWb2qdKxWKBlOeo7smKI4cZ3c/CZ9WGKbMWIWlOtDbXvyfwiwLSjQ3ad06Fckmg
         wMf2OdPHtYVKrgiHkoiMymnSo3JwSI91LIKucPFyXIgDUb35bD9qSi7yAE4KQD9+y2hM
         Md9G6mvvPGy2Kp1qHBzXoUba7RdgcZKUJCaAQL/0Y/srj9E5jDJ8c0HH2ZDI85CyXXFV
         uwI49kSOuHsqcmuUn9QR8mLQftf4wOa56m2nRgDoaKdVboU3bbqvVtWip+ybQjINW+Ap
         qdXUJbiF2Vsj+9q07actR39XrgQx8t4Im1WL7s5GA3GocST1s/9pTQh3k9kIWYH9Nf1G
         uJRQ==
X-Forwarded-Encrypted: i=1; AL+hErFSVRlhUFA69K3TplR3+awvncsZLGLYEk7rzN5zrSgJt+eguwGQUvqpTtLY44FYijKCHyg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8XrXUlNwuUFny8tH3sJnoWCrn/Ud9uSfGoQOrtew6tk6r+lqKH
	TmQNF2Hl6epUOZtOGoIuz1qlW3QrPF9ea9oX3bUPvhV7Sxgw3TZuQpl2BIRDIOy1bK0=
X-Gm-Gg: AYBFou19qH8qW3b6ljChDP/qOZwHQsvKDNBM4pwcbctZu0C9EQe/5YbZ9lSg8uEcZs/
	FZ5Mmo+xVD/ZbqFjup++4idUy7fD7MMYAhSPV0uQRi91g1PoWfq9iMoOEjfhP4b/VWqff7+B3e9
	XnGLtQoTgpSZ9dsEPICf+QOpR9o/FQaaM+t7srwOPGSx9D0k7p15A40/W9xHH5dHpq2Jzw7u0gh
	18kaGcSkA+ghp7MXrnEZxl2QMPa4HLCZmXPMpsVwhBAitRpKt/eskfPO3tjQukZCPJ3PzUUCI7p
	GUcqLM++/w1kyt3oS/RhV4cLdF2s3J9z6fwE26js6I+K+K0hJ4E2kPvvfG0vO653tNsDnFndI47
	DVG3GuGkfWKO+whVoI4p68ZEJqM/EpcbymMRofwPY0RXSvv27ZWzu8chxG3UDlgOsJB6oQYoPku
	MM/jFf+wiSX2lNwIHwPaf4OXwVdW7THcc4jOMB6Ke9mSuR/Tcy39FaZoTVT/GrfNe0Qy8wmalRg
	LspE2arg3u0vZBhcqZhjd1w60QpOUnmeuhUWxTmd7vzEbhr/RbQg/FAkpcG8FSStUGPRSQJGiyP
	TdFSzFj+VnH7jnM8AQOFRcBmPgrNaJsEhBU1u2L1q3yEMqU=
X-Received: by 2002:a05:600c:3b8b:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb7da1b581mr45003055e9.13.1794992963264;
        Wed, 18 Nov 2026 01:09:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:22 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 18 Nov 2026 11:09:11 +0200
Message-ID: <20261118090914.38082-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118090914.38082-1-petko.manolov@konsulko.com>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

