Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF6427F9E
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384495; cv=none; b=s9HKvUrxZ/XsyvzsFuo2hFhg0AKUun0VOQjZ1MBA3wRDtKADu9T+ZbCxtaSJFE4QQZF6Sjfe0srvpwzDKEGQ8opDfaCV59Cgk2NzhfLzeCII9Btods8Ft8fUKzYuvRNNxJqVs2ibRI46U8txAg1MjvNzI/tL1FD49zvFDhAMC4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384495; c=relaxed/simple;
	bh=wTS3z57ImEeKewCgziOwsh/HcNK3of+DjiHKrAWz6/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eoDKt6kkAvS63Zf9XXkxURO8DHU53S0X29uLmgdzz7Sp2GgaxOYPvNRyls57eZOAgX4cqmKN9NobK+UoV1j087WscDb3F3o+Oqn5Uu0doxtIftQ3GeFA/Lwfp9vDyxKfJ6Z9bsM4Xc0eCxXp+WVE7jG9/Eaw0a7MQFFbZ79S0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skMCww/x; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skMCww/x"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1638891a91.1
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786384493; x=1786989293; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=;
        b=skMCww/xBfLrw9aTxX+QUVt6lAQregxjo7uqejuw9CzKrDXi9O9W03gOb0F7zIBTJy
         WhTXT2Ujz+8dYbgRlWiuBGRcLnBrmLA0UCUBks8ZmZpbRA5CJ2yRvbR6ksvI2B1137KC
         UTnd4cUiIkca1YnPBFhZowVqQGvbqAs1BnMb8/AR9hL1c97MnElIDOvee4GU7ar8FjxC
         OfK4AX+6KOjvNOGhhFAnA2JpH8CkAp6v2bHHQpsWmZPgHV+9mnGl0BGmdw5HkiY8F+DH
         sxs25kSp5rSamhsB+y6kxRv6Kkze6bs8+ar8cv5gILtwIxtW5vGK51sma8UV5flKHR1+
         MsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384493; x=1786989293;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=;
        b=qXT+pQcEYoSBoMs0y8Y/RB6y/kFVgCQKVvCrC2ZF8JvZXYUEroXy/trHuNgMqsmETC
         dJTbUK0p10AmDEi4vMLufdMJHNPMpXgLWzhsDHh4RQnqPI779GqengBnr/QCIe55Y0Xy
         WMQnC0iANN+cG6fhh556aCUoR9jM58qRkXbfZmwtwyOvHcaEBP4wbY5x+r6h8ojbFK9b
         pEAUDYBJGw+WK51pJ2bZp5dSmlPlotJEm0+PSU3IBNJWb/vdE/1y6kWGUcEwca5ReC3c
         LFWB/brGRwPJ4Zrc3mvETfwA/cIGFu6roTqrK0dLeuGW2TFHdnFkLdM1DDg0fPWjtTTe
         0o+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEVJSxA4Cp7rzCQ+bypeHTSxmwZX6ZRReDc47Mu4OyyUzL5mUOkuOeUXj7gjddL5VKxa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRStWz5o76hACsOkNNt+pkwY6UTT7BLOt/g3AXIb2BYul1zS5p
	QEBpRmgvJYNA4LlcmniWfWycF0lf0+RSBgkxVVLNcLusrjgDrN5S7FjP
X-Gm-Gg: AR+sD12EqiyJXFmubvK83/L1c4gnlp+i5Tvd36DiSE2gOINgyHmXLKOsXadpdFH4btN
	WtL5I0ou9lx3azOyJeJ2bZwZ19kpPhCo4DTCgUpTqHIcWFxG8plpCtvFXrb3CWEobB+KyxdsBzd
	L9vWK6hwZUb5sQVJAB87Wn5EvAXOwj1sTQ2KIi1JNpy2NBZ4cKuQkZ9Yf3Kf+cQwagqIXcTRX2a
	FEbCIFiHf09iH43SB3GKaY966/vqQrUUDoNy9Ct2KM3+3VSc9Zl/YLStPFt9cNKIBBAF5dEeb8c
	Rczdh9B1G/eA3PKtMu9DCMzzC/D556VWN3Kum+JkX9wxMQ2qsxWzatx9zDkLHryI9IlWuHv0O+r
	S42UAQWi71+BmmlApGQl/tlss4oClYGCdiELn4PGtn1nDNxw0mrULiDhkKTs0f/Uzx8ysQ6EfeL
	ys3cLsa3Tp6QLJpJGGV2T3nSpZ62Aj7Qwb13YNhTEOOQSM/aQ7V3veOe4OmgCH6Oo7Iws=
X-Received: by 2002:a17:90b:5444:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-392821fc107mr21840689a91.2.1786384492786;
        Mon, 10 Aug 2026 10:54:52 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm421004a91.17.2026.08.10.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:54:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 14:54:45 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com
Cc: regressions@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	leonardo.costa@toradex.com, francesco@dolcini.it
Subject: [REGRESSION] mainline/master: PCI link creation fails on Apalis iMX6
Message-ID: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

We are seeing a regression on Apalis iMX6 where connected PCI device
links fail to come up at initialization, as shown below. The issue is
not on the devices' physical connection, as they worked properly on v7.1
and are working on other stable kernel versions.

    [    0.154243] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
    [    0.154400] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff -> 0x0000000000
    [    0.154439] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -> 0x0001000000
    [    0.154553] imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu 0x01f00000
    [    0.356072] imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K, limit 4G
    [    0.356181] imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
    [    1.364757] imx6q-pcie 1ffc000.pcie: Link failed to come up. LTSSM: POLL_CONFIG
    [    1.365056] imx6q-pcie 1ffc000.pcie: probe with driver imx6q-pcie failed with error -110

Complete logs: https://paste.debian.net/hidden/f08cdf68

This may have been caused by commit [1], which was introduced to solve
an issue where the Apalis iMX6 module wasn't booting, and this second
regression went unnoticed since then.

Is it possible for all PCI changes to be reverted back to how they were
in v7.1 before the next release?

[1] 7678e81498e2 ("PCI: imx6: Fix i.MX6Q/DL boot hang caused by improper PHY power sequencing")
Link: https://lore.kernel.org/all/20260629143439.361560-1-leoreis.costa@gmail.com/
