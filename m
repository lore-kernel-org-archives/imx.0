Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957431D4171
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850360; cv=none; b=LGA4wriDGMILJolCmWwoh+q70m9p6Ubv5cNejpWkFvT11XqHkgnFBUgdVEffupKMgP1pe2MhViCa8vOx685nYILRr/vOcrCrDCpEeLWqR14s3QMTtkHnFIaZq1fWmvnDEEm7HzY79E7Qd5NiHBYZzilWA8rw2siQGaRU+GcuhG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850360; c=relaxed/simple;
	bh=N1CyolZ8tBLpfASJJeTZ0XeLoaebRErSyJBGK6pKilA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILO0qaAMUS4OCrBGMM0LwqjWRDmwjme0M2+DuLUOE3mng2zWbxxJMQUfDMHzzBCKDQQO2wf+UBh3M/jIbSkufUB23VxeRCWNDIgvqcJSNUSKwC4JKtkiN+4c6tMKxyQnapv79vCWFEU/aTRexANeu8Nv4TUDdcI/JUsNAVjlmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFY/BxSr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFY/BxSr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431616c23b5so13167795e9.0
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729850357; x=1730455157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4cr4e2WpYdldiza6Smv9BM5tV2IoSAN/lMOvuaNoy8=;
        b=IFY/BxSr1WKUfrNxz5aw9fNgN1KUd1WlBRsXAqlGCrNBqzE2UoIIWART2idyj6infI
         Rv1/Fo9W9+oGEwqRcqtDmcDPqQwaLg1REgwzCEp68Ycj5wvWNUcrkIT0CQ46HhcPazGh
         Vjev4422V2bz9PgHa1BHHMvXY5nRLDW5hykvwZNQOGb3d+GyP5xmcL6o78EgFX8G0Gia
         pIu6zwnZ1aNqMkcmD+C73u6MiKVcceoRcNwLpSmwlIAlDUrcQYBEybQEbw0dTQEQe9Fc
         THQhg5N9Rwh4RCp7YUA2qJH3MQmg86Z1lCPasJzLPkNekDH2mGVLpGCzT45XOZlO27VE
         ioiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850357; x=1730455157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4cr4e2WpYdldiza6Smv9BM5tV2IoSAN/lMOvuaNoy8=;
        b=FTf6eWtuIBPvy4ggriKdRFT7sQU51zJYHp3ziIkO9cSdH/+9xIrSpjmr2YPVAE9w/A
         vifOyVVoyF+6pkNUHlrWyE8piZO0izBBoPQocFQh74i/Nz/nKkP8lYzRi+I9Y6Mk7vhv
         txRnaG5ETqPezQuuABOEuUc/8tRN89Ep9N+D7kX8Zu+HIizOUk4k46zMzLMD9m8x4VaI
         LADhLNwA0r+FL3dUbcKVFfPcT8E1JFap/q4MmqyeEe97t13LDE5iqh9AlW38oA9hp6zf
         0FxDgpZGz/vlTJdUKoms4V0z7JzNv8ljPy9DiZMQ0bYxAM9x5eYM3JbV/FT7DhHY8GoX
         KH8g==
X-Forwarded-Encrypted: i=1; AJvYcCWaJTmAx44RKbCrgOHlRbef/WUNOn5/OSK405qF/tq7tx7lFLVaV5W5aFcvJ1JoFaoonlg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Ph1CxnOmxLDvw1FiSkrmw2M5Z8AWfnwek1Z15rVr0KYlT0mr
	RphVJ56TxkKw+x5GDb9J/rsOo8olGGgBOA0eLoNUod+6/lfI+XJM
X-Google-Smtp-Source: AGHT+IGsDr1xiNpVz0zWvEjm8K23MeXnqNJoj9pKxKeUpb6r2cNqS3tSAm+MEb1ei9011b3zn/BiAg==
X-Received: by 2002:a05:600c:1c81:b0:42c:b67b:816b with SMTP id 5b1f17b1804b1-4318b587a84mr36861205e9.1.1729850356816;
        Fri, 25 Oct 2024 02:59:16 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:7bc0:826e:69e3:7e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm1098214f8f.32.2024.10.25.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:59:16 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: imx8mm/imx8mp-verdin: add single-master property to all i2c nodes
Date: Fri, 25 Oct 2024 11:58:01 +0200
Message-ID: <20241025095915.22313-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the single-master property to all i2c nodes on the iMX8MM and iMX8MP
Verdin modules. This will allow us to use some single-master
optimisations on the i2c driver. Together with the following series, now
in the i2c-host branch of Andis tree, we get rid of a timeout problem on
the i2c bus with a SMBus ADC:
https://lore.kernel.org/all/7ts577rxed4mmfkfin7kfdjfjkb6iak2y4vtgtz6merwxkzz6w@h5aefbvyx44u/

Stefan Eichenberger (2):
  arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
  arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 5 +++++
 2 files changed, 9 insertions(+)

-- 
2.43.0

