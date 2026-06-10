Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603A36A341
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068014; cv=none; b=agGtePvTS0b5S6NEMPpM2C2gTNu9ROca8XKUu8leUohtKQmRtUHxd+MGDrnfCwdTpyTrolo/hO+N34LSBy1uk4QLA1hiWKmzrpIqbb7Ygv4S5ueWr44sEuhEQSKihl+HH0cSgtDvCDYyn1uqqiwt1P6C+W8mk0MKQSkdixH4XIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068014; c=relaxed/simple;
	bh=ObATbY9LnO8WiYOe/oY/3Z7+PZzAkwe4OL79QWUiQAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoNP2lc1pzJwvTdZhm4l8R36TVbDxIA8FABan/oEK8pL6viTuE/cw6fhnaMHNi6Jb+KctqOxDSlDRwGMJRZ4wc8b+tm6A1PKU2UKu7aUzmv8CJE9EbprRfY1H1HS98+6WtbGzcv+PqZfunITqV4ZbNb4XD4N9q9sVLLornlfK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COuhFiT5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COuhFiT5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so53106925ad.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781068012; x=1781672812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmpW0QtKL7WDZjfsG4xvFm11JV+f+bzZkKOrbkR0yY0=;
        b=COuhFiT5BGH3CRi85nCr32+OEi5IeKXESqW3VmXL1B8duzGrvPIE4INOl3ubMNE8lW
         AHJXBtx3G7nZAA+YwMpnhDCR0+Eacp4vNGlfvyasFEEhbt6r5NZK0t6G1Z0qA5mqP0K+
         C2OItUt6jjShW3N5KKZYOBIM9meAjPoAY/8xX/ZjnXtFTbiYP0Cty2kwUI4aD6lFGQkj
         yorIkwe7JFyxyq2WMyaWhgE0FPqsmPFf7j/J56gYid1n8qjSqUhOoFMZiolbH+3g0B5a
         iF+3t9fK0VCaaVvaO5bV6f+xrUsIybU1npnpNJfnJppbLPO31yxjgh9fNL2A57ft2GpZ
         WtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781068012; x=1781672812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmpW0QtKL7WDZjfsG4xvFm11JV+f+bzZkKOrbkR0yY0=;
        b=Y7dT+IPkCaUXAa9sqmBVkHzpYh27ekBl474eCBTz5E45tJeAH7zwexg1DN36B3a4tl
         PlpVrQBgVel7cqlLWk0wvZ7JsrjU0dX/rFYawoR+Az+9i4+/wC2t0hfO61D5fF2uNzZz
         DmB4RdCilKz9Jip3Wl5jb2oXfNvrTlOi2uay0rQOxbGmfs5Jwddk6niZ0SV3KOTlaO6d
         qb1jrEG2r+9UDODlCrD8np3Xq0CIA3vbxJbhJT3RWeIqxXUoOFe0dln+DYpS8S5yt5Lb
         8eCIxsQ9huiZn24Rlwz18TH98KRFdYW6JqPCW28bRb6hcH8C9mzmLT0bUijupunZipRe
         1hrg==
X-Forwarded-Encrypted: i=1; AFNElJ+NYZTeC831V8c0MYoDJdnBCkaXWj0JDOQLz+LCGzl4KVgmA0JjBJNw19cV1p7P9/ymwAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvLJwzwf+09plE9jImPiI2E9zbMtEOQESrsxarF27LpkR3yRel
	Jbzp2o0rdmfBzni3uycA7AViaeOKsQv5mQHtU6EJyAyg3usJtKSURkKj
X-Gm-Gg: Acq92OFwHZxoaABFBQwqSJ+uaUIfE7w2T8pT8vNEQWzCN0F5YhGauDo5LzKttqhnquU
	4WDoevv+A2euYX6pqnuBwxBNdi2xNKCXFaNq+0XOgjv8XyKIicjB1qcLjuN7h3+ikKIBK4TvPQr
	Q93fvYyF5qu8OdRp/rtWlCRTk4wCXubp1CPq9h/L4MRayktNizMOwa7WOib+WBb8YGnmUEQNIsO
	rXJrTyM5HsQoPo9kKQAiAIEpRZMEFSiZPCj7SUvQ+JDLVG7LnvaaXRj5a+cl9EA/R0Xj7HnSqbj
	gLQ0zcm10ZYXzyfuY97N+Fp9Z4QR+eVlzLtJxT5nVqBpugRa4nVeiNlC4xhouVR9YUY+he65CZ4
	YAmYWtJUI11DMBk/YhOLQliwqBp9TEoUPxpLzmhJnhg/BUGScqY9C7ZuX0U2KF8S758D5gvwRz9
	MJwy7iQ+5glWQ1L0GzAlhH4WWtrHB/i9CcHPnQPqgyniLirSl9+USe9Bu0KzuXQQtG+5zM7wn6C
	Za4b8jTlAUwjXMIQ8eXe6HSlN4BWk5Pl30W7fqOBururXUgFNmIsA==
X-Received: by 2002:a17:903:90b:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c1e8350affmr283521355ad.36.1781068012570;
        Tue, 09 Jun 2026 22:06:52 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm245342055ad.5.2026.06.09.22.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:06:52 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] ARM: imx: fix device_node refcount leaks in imx7_src_init()
Date: Wed, 10 Jun 2026 15:06:25 +1000
Message-ID: <20260610050625.2229221-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx7_src_init() obtains two device_node references via
of_find_compatible_node() - one for "fsl,imx7d-src" and one for
"fsl,imx7d-gpc" - reusing the same np variable, but never calls
of_node_put() on either. On every i.MX7D boot up to two device_node
refcounts are leaked:

  - The "fsl,imx7d-src" node is leaked both when of_iomap() fails (the
    early return after the mapping) and when it succeeds, because np is
    then overwritten by the second of_find_compatible_node() call
    without releasing the prior reference.
  - The "fsl,imx7d-gpc" node is leaked on every path leaving the
    function after it is acquired.

Release each reference immediately after of_iomap() consumes the node.
of_iomap() maps the node's registers but does not retain a reference to
the device_node, so it is safe to put the node once mapped; this also
drops the first reference before np is reused for the second lookup.

Found by static analysis tool CodeQL.

Fixes: e34645f45805 ("ARM: imx: add smp support for imx7d")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-imx/src.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/src.c b/arch/arm/mach-imx/src.c
index f28bfb653a88f..c3c80b4c3d53b 100644
--- a/arch/arm/mach-imx/src.c
+++ b/arch/arm/mach-imx/src.c
@@ -196,6 +196,7 @@ void __init imx7_src_init(void)
 		return;
 
 	src_base = of_iomap(np, 0);
+	of_node_put(np);
 	if (!src_base)
 		return;
 
@@ -204,6 +205,7 @@ void __init imx7_src_init(void)
 		return;
 
 	gpc_base = of_iomap(np, 0);
+	of_node_put(np);
 	if (!gpc_base)
 		return;
 }
-- 
2.43.0

