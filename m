Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FF1D86DC
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 05:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769576759; cv=none; b=ikkXfOv/lyTZGbXXjDDN3OOmIN++GGKXcJELRLv4VlcfVruYjzatCcPER4Sa2GTMdPkmp7q1vUou19VTNjuWeb41hYFiQdf7LEecv+5LNz/4MtwEdR7Svq3bRZO40d3dZHir+nFm2AlV4CtkTf5ROGsCjP8DNBA9z+PF4PnDucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769576759; c=relaxed/simple;
	bh=Lzp1fwqvRTTLSnLUD4tRHtiiMaXExdhwpaE3ZrpzMSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQeaAQ9quKMHfE53On8hDVKr5tSXXBzoNgp0pzixn3BJudeho6rlAcUyNFMMdkwCAlVR39jc9TvVrwr70QvsNUsWTtw91EleA6d8vbRp70v5s2XG47ZWl/Xd8GSfll1L3gtcqeF4QDa7lXo5Ul/BARfZJIrCT3iwRybwHJQIiLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzwrUMHV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzwrUMHV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a79998d35aso41314925ad.0
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 21:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769576756; x=1770181556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pftsMK2Bn1JCcMxWOi9xdDs4s//i9MppnFiwPUF/boY=;
        b=IzwrUMHVZlDQ2iDthCVBlVqCHf6JiBLQlcfO93cg4/1yYjG80b9rpdiLEWE5e3aGUU
         zUXhOQmdCcjH/blHTNo1Q/WCUotlnjhMA9jLO4xGEHzBL4I0+jPAqa6+MNj8qW/6dNIq
         XNf8i3GtW2aTJiEaOAk1m9GaHsBjjCLtjnNujVMItnmrEk/Pw/LH9zhu/6UNFCqT4ZCw
         t+lDDzNL9D0+1R2O2xFenEl6fZ3bGjZ9puKFXQmUzWbxtLlTf5TchCxqCuJW3w4xwaHV
         7KKltUaKyBwzbaYaIuBWbzenaC5JCUkhguy/ZbnjF9RmbMerEQ5YIuRRGK6KzHbiL4kd
         n1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769576756; x=1770181556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pftsMK2Bn1JCcMxWOi9xdDs4s//i9MppnFiwPUF/boY=;
        b=g8QixHaMYXI21E1r5afQNXiThNYQqfv6v8dQKnxpMygOgGj8U9C6I0eXpg3UPb4sFy
         x09UOdOHsmfvPlJunXmJqERVTDCzvdDFsSVSZWFJsHrWaAUrY+QWwCblTZJdiA2z4O+E
         9n70KvxTOP4fUMqFcVKK6tDFvlfsV7YU49rMWgYZf9ufHspgeIqildydDEcPG2JUZ/l7
         d+ABGy5Ad37nZZzHPNH97l/G2zYVh3iU0xddY7QYqd4qkuqZq6RJp5eNKIoI1DLqTnCM
         SCIOqrEAFOLGbsQfiCq7gJu2ZmkoH7B5x0c3GwZUjqKR9sokIYm/b9gk/zKYQR2yBnMu
         M1Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXBiDv6N/7e31oxlkWSLDPcFa6V1M02Ro93OH4e9u6lNFfSxFjRK00UMz6QLFTcLoxMwoA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD6TgqomDfiaWpbRiXl08QxNMFS6a2W4U8OPQIOEREVbG13i3C
	6MNEVEI0xhue6rboxrT5jISht7WQijUUAArzj4hmss9npusPwZ0+LGdz
X-Gm-Gg: AZuq6aKIOjQKej7iCpHwR+40t/db+Jb2g2IJDnx6uJzK+54Jg2k1sA/4eQnyUlkEyvp
	26jEYCc9oYOb5D1KEpMjNVLJlRd9xLkaWCuvwo+6qkXhpJuCfMQKI+wOKKoGgBzA0EYEYiWM1Qf
	aQpSlSvaaDsHHDs7FygtVq23dEU+L84ZWh1RJ0M2pnTijfN99TEIHfTQIkcDTJWt+ifplR3yzS3
	yeHLmRpyGUAN2999mH3Hs5c3d/nmXsYJhMM1fXnNw7wvENyQTOGoStGP4kUqYGDCKSWDt7TPPwE
	O0OKnopyepOiAQE91GhCmXSHP/ZJ/fmkenzhseUuwk9tHDCeYPl2RY0zOsR20/DIVG/xWO1zo5e
	0Iq0i5PwykhGTyirGgeD2AjznaUlmMGLi3xVHttj+C6FsiHaUP3OrON3RXnwFah83BgmY5Eaaps
	qF0eT07fWi/CNy4SMTeWtHS3npXB7cF5V5bUsXZYqzByVB6Jg04e2huO0=
X-Received: by 2002:a17:902:d54d:b0:29f:2944:9774 with SMTP id d9443c01a7336-2a870dc6ebfmr39393185ad.33.1769576755960;
        Tue, 27 Jan 2026 21:05:55 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3ee952sm9736025ad.14.2026.01.27.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:05:55 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v2 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 13:05:48 +0800
Message-ID: <20260128050549.3337279-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Fix Makefile alphabetical ordering
  - Move vendor property before status in device tree
  - Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0

