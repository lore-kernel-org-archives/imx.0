Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053733A9CF
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068003; cv=none; b=I14x96nsSnLYU4ClMvVGnd2ZM9VDZ9ffs+Llql5kKQhl4K19LghMnjofiWCVYYwv5h3pIKloQUiox0j9GWC4xvQi2aiD/DNNFDcWmf+oBvC2P27IPKohkrWKveRg2DubixrYmVFOjKcpVfcgMNnjG/I29KfEfSC8rBORH6lqbDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068003; c=relaxed/simple;
	bh=g6cvCqY/wzQj8/576lDmohy8giGp7pz6yFdQL1uoFnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APLw97HKulBXmvJyQf02XB4JVgJsrUsz/Xcd304lkaz/bxO1X5FZObqvgMT6xI7lmJTuQosj06vQ5aYZdOESvxtm3IO+/mqFe3H1VGs6QhAjpfRj2w+G9b83TQUiJbSyTCTxTIGLf3fs1iHwtVnhzuBJ73int9k8G+buA8ismYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g79/Go16; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g79/Go16"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c3184c71so48779885ad.1
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781068001; x=1781672801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9sfLcW2APM8y3IVh9/744JaGOXv0hWh6z9HQ9rarp8=;
        b=g79/Go16wSwIH3qJQ3zgWdCqf1zGyu46UKAmztjfQVxFH34QGPa6onECKlldCjFAje
         We61MTCQIX4lKByTiCJ1jrV24qEaiYMp8Bqf4/vXalk3DtD8Ii9KF9n5bn3KtcOYG6IX
         IqFeOftaimD7tHuJ4yvgcxaxcVjcLh/1vC+d4eSOyCBr+ImqOqfYHRsVXpH1heuH1ynU
         qiA/4ti7GbbFGjoYX978wCKtMY8mytmf2qIrS9zGSxDq2YCQfm1T5VwP5x77QRhvYNyV
         45Zq66TOGuqZEn/W//DuSPvGb5B3PHMAWRbWB8umvnF/WVMZe+g6Y6mA6kk8VN4x0Cu5
         xIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781068001; x=1781672801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9sfLcW2APM8y3IVh9/744JaGOXv0hWh6z9HQ9rarp8=;
        b=cQa29pkrJoqArmqbPh4AqYSeXPCnY9hzMjKjy4O0sGq00QYDF28lN1Cv9666kfH0qQ
         Y0s+uVsoHsDG3jlT+ZbQmEaA8brW4ff8zP5kLSsBYLpu+wYAyxmXA+fmIiJFhcOzD2Mj
         8zJZITn6LCvx9RBwYjyBZ0VhZ/1+pP9UJ+ikuKbBOKK4hVtsRodo1xCAxwPZpzm5eCyf
         HYMWezG0ROyF9CFQDLYHB59v8tEzD3tHZAy+279OU5P20FRJEIz4a6CfaSTZEt1uvman
         6+BW8LNl4oKo9f3UDJXixqyHg5o7u+kxWQ1JF2iynPZd3Wx4ZjMoDewUkhH02xEAzLm8
         fpag==
X-Forwarded-Encrypted: i=1; AFNElJ/b9SEiHHl32du3LfdSUXH8azdVFku5hx4FZuIrvIgxP+aVwdTwbQhXE2VDYXpw3rjjV1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZWE0aWznFF97Z4pLf+VwyYPCN/iocj+D+n4Z61tQbPTXHUFBP
	3PK3ca6ds/lAC8KAKyy7EKflWZ9VnDh4A+OW9zg+EH7haDHr4sdvTrkx
X-Gm-Gg: Acq92OEsXJEND2B/LjJxYAAEHmQMC1T6ZBVKdoCtYRgDeBTxe+512U5EGw6iTeAjDeB
	B8L0EGKDWTwrkBlBfQxsWg3KPAqItBhPORPRnbMIQDnWpkO7GlTCndOeC5ffStw/PxaOE5fbxGQ
	U796t0jIuzCqwX+IGhBfbDfKqSAlOjJ1q6DEcgoA54MmnPiFogAoHsN0e53AXacP81KcBlFRb3P
	806t2KhYK5p1znE7XyUKIeCAaM2Z10FR4D6YHcjZc+Kxps49Y/dfc6Rw06QSZO8aTiBT4+5c3SZ
	BSfXBHDDrBmksFzsH+QEP5RlkUgR1hH3KzhnVSP0osL4/ynokfiHRk0rHTE/4f44wznZFeCH1cS
	wL5GtKko4NMKoJ7y1bomA16IbMXycPhakiCZZNqAfZQs5Waa5QwldX9JfP4RkK20z7K4+LI/yQU
	GymD63GCSxT4R8ZYY1yk/N48NwGKK9ErU+DXzYCkneF9IhnSg/drdee/mQrJmzN2pgI1pV1SQ54
	NetjDwDt/oNd13M20LaKzAOTdntVfXyeee5O/oy8/xNRIzWTnPG8w==
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr221524105ad.27.1781068001214;
        Tue, 09 Jun 2026 22:06:41 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm245342055ad.5.2026.06.09.22.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:06:40 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 0/2] ARM: imx: fix device_node refcount leaks in src.c
Date: Wed, 10 Jun 2026 15:06:23 +1000
Message-ID: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/arm/mach-imx/src.c leaks the device_node references taken by
of_find_compatible_node() in two __init functions: imx_src_init() leaks
the "fsl,imx51-src" node, and imx7_src_init() leaks the "fsl,imx7d-src"
and "fsl,imx7d-gpc" nodes (the first one twice, because np is reused for
the second lookup without a put). of_iomap() does not take ownership of
the node, so these are one-shot device_node refcount leaks per boot.

The two functions were introduced by different commits, so they are
split into one patch each. Each drops the reference right after
of_iomap() consumes the node.

Found by static analysis tool CodeQL. The series is build-tested only
(arm, imx_v6_v7_defconfig); I have no i.MX hardware, so runtime testing
would be appreciated.

Weigang He (2):
  ARM: imx: fix device_node refcount leak in imx_src_init()
  ARM: imx: fix device_node refcount leaks in imx7_src_init()

 arch/arm/mach-imx/src.c | 3 +++
 1 file changed, 3 insertions(+)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0

