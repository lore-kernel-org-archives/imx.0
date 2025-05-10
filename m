Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667C1F1507
	for <imx@lists.linux.dev>; Sat, 10 May 2025 01:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839934; cv=none; b=nF9nON/EfEDYQN7U1mYesskqsgG6NU5F9J9ClGDG5x4f5z+WACLi8MewgyhLkTcQwpPvFYu9/PkAoycXfoj6AqsYdqKgFkSXIt1rQ12oY/5bljlSK3lWjjYDl1/e+7cq+65KUbUqRvyoul2puvnmjoSBURcqlb7eTLhSUP4oRIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839934; c=relaxed/simple;
	bh=PbYFQjdoKu69RC4WNgwhi5aZfsI3D2anxiI+WrXsHYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oO9NF/GUXKGt94gfr6nFgbJIGXDsuWvyZW3dmP/FmP3h9KmY/OffYbsJBmHlcVnIDPBMwdZhzJ0sqCWw3bBQtC/WUHmqK+seRUMveu16Wp5eti6OulLYTiGR99wEAociM1m72+rD55Zcjz+G1YierMb3ClUwTmqNMHpJQdzbPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3fC5K7d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3fC5K7d"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so12856665e9.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839931; x=1747444731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=;
        b=T3fC5K7d4NGkO+gi5TE7J8eOf8ohBYPIEEhQ83bflDhc1GvEwxnMQRFbZEZgtZWkrj
         4PHwNUmaCLCLPaYjcxm0o9gNx67L9HnXogVc2EuBptTGTbf7Ihsk4ZFVHtaDPZaymEsC
         NfuEPUTAsH2U1mVrnHr+5qnpXxpsPb+x34sI0sNyHYsI9z+0ai581ybW+7psZUfVynbA
         rMKIk2Wy+ZFjWoUts585QDETcZLt1gOWnswwBAyhpIi5siIKKSi4VJHo+lMFeWu5/uee
         P1sed7AAfuTe2UVTNChj+vW64oALA755/B3rVSy4LtjLqTfFSZJwCKHxT7trDsYqRJok
         qFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839931; x=1747444731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=;
        b=Tu48tcdjS8Efv0ZT4n7uFQrvBYYiR8zf80/HNgLl9UJfpaxd6R8+SDIbSP+yeulkT5
         3IXTcUnvQpSCwvCVzGmKZwhlejk+83bCJjnTW8MtS5oGO9l8aQWEObuK2FDmLEPQMdLK
         y2fNMSc8Lp+uEEc10B1LIm9vhGjAGh8LGhA3NO9UXcjYRQ+iQ3/3Brji8WxJJeEo0dU0
         yrq+Uu+fuh5LNdfsldP/ahXhykYT+nhPQzCpmSs/+XcYEe0zjHr/icmp476nx475G0OI
         FyPE6F9iqrNIN9PZStmpgJs7s9XS7rr9KoO5Cq5atHcEPJ6eNeGGhRXN0NUMKCkeYTlq
         4mnw==
X-Forwarded-Encrypted: i=1; AJvYcCVaKMHihk2AUesbsFheJXhR5Cbs69/C1W6appMwPdJJUCqhgsO6Ml+bzrzoFn4mCca9OtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHM4F81MMiPE1ptaJuSo0W4dLKKtGX+NiO3Qu9GHpSsxAiG8Gi
	ljjIol6cU9dcjiMZR3963PVcuMS77kZetAly+IeyHpOTvTh994yL
X-Gm-Gg: ASbGncu+/ZPL1htlJqwzcSaew0t6fHP7M6amxvvnOQfnkNaHhifGIvYUYBtGApYhUur
	mUmfUR3FeMSx81jaLxNPsjdBImyKLJjvgB9UFO0KT8uPQDr7EttG8xm4S28njBe17L13kxGRyTH
	3g4fAWLv5KfddJMM8yucIxCr/FY/MlJSC76Cud/Jg9Oa7nAAEPUrZADzczO4Txyz/j8gI8QflOW
	FTGfRyVBy0xHVBjmAV4ngc8ozbn+guSmZSRIVPLulMlNome9DP+2/NNdKS0g08z2P66moSjWimY
	0YmXL5lCTrD8F5tRDcbBv1FOK1Mle8gwIugby/LtZ1j3ES6GX4hWIVzzpo49/N8aIDMhmefsgBP
	lebDCvA==
X-Google-Smtp-Source: AGHT+IFnYaVPCAzu64yluN6ujyxlAajvDa+pg82hQpa7k6WPDQeLMevDuZw2bzKwlYilO6uHfOQAvw==
X-Received: by 2002:a05:600c:3586:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-442d9cacc19mr33564445e9.17.1746839930843;
        Fri, 09 May 2025 18:18:50 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:50 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 0/3] arm: fix imx_* defconfig
Date: Sat, 10 May 2025 03:18:03 +0200
Message-ID: <20250510011806.13470-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling the kernel using affected imx defconfigs lead
to a hard CPU crash that reaches a state where each register,
including PC ends up in 0xDEADBEEF.

That is because the SoC support depending on CONFIG_ARCH_MXC
gets disabled since CONFIG_ARCH_NXP is not defined while
said feature depends on it.

The default arm defconfig is unaffected as it defines
CONFIG_ARCH_NXP=y correctly as excepted.

These patches solve the crash causing my confusion:
https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com

Denis Benato (3):
  ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
  ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
  ARM: imxrt_defconfig: define CONFIG_ARCH_NXP

 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm/configs/imxrt_defconfig     | 1 +
 3 files changed, 3 insertions(+)

-- 
2.49.0

