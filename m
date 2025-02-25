Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A7212B32
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515444; cv=none; b=uECVS8OakMaotNsPKszA25TggNSl8LgLtSLZ5FjUmlSdJC9DEciQLWTxIG3uZ9TaFAzinWyErctnszp/mQynSL7OFa96y3x46pktfp94yQP5Va4i5wvT/+toydoD5bu8Q0D4h30PjmhW2H7R+8rbDBqgTKa7Ioyx8uI5fopAL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515444; c=relaxed/simple;
	bh=2mVGB3ONfKEx7GJ+S6y95LCKLGj9XhJhILt75fQVfOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZtF5RGpbOnXLBnABoNyb6FInVrMGAkO3DEC8Nccg9aYXTXsID3cbPVeBx7BSmEuXykPZnOUi+9QiaY0D4gkp37EswJaRL1MlPVaOREhMhJKH7MMaEM8qMBaFRpZE5FpapDkqv8nN2VINnFP7p5apS5w1aEi25DnL87PoPZGqq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=QarCMLh0; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="QarCMLh0"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-855a1f50a66so157306739f.3
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1740515440; x=1741120240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLp9Ea62UroP9Hu5zCjkj8kz5zOw20u3Q4aJrEzL0tk=;
        b=QarCMLh0c9GJy6t1LV4RDiFmkABemwC5x0QLKBQtPwhrkOl3Xb062FiuYMx9EN9zQ3
         E3k+my+SAq40pXF6iXvVk6yq4YgDDdLwaCsTUQ0ybB02pVT33DyxrN+zZ/h5IXDL6GQ8
         NVYbR7phQHnyqymda/3mXxi3kJzi6BGJTeOTFeuSuiSNjbX8e/yTribNkSqdrVZuNxyP
         jxl9kDEoIh93MclrPX35Xwwe0o8upvmrkZNNnbAZL22psFhwdN8lbU5j1alYGQgPD/M2
         Pa+uwRZU5nkFiAxJaBgWvbyz4DBINVhVW+CrrUL72OJNheuRGhsFckZ+8iJXyzXY8bG0
         DQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515440; x=1741120240;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLp9Ea62UroP9Hu5zCjkj8kz5zOw20u3Q4aJrEzL0tk=;
        b=OZxUPSgFyNohYqRZuVy2QdBtoq/BCXV6piVzKBqtTJ+XoNNPPp9r8WNxssmG65F3RU
         Duf8vJaqfhIB7LFr6+PgxEbQ+D6HODMKBuNQ3lTEtwozEJMMk6JNP5OqFXOOdP9mClne
         vyRGxcXWT1EygQm4YKgOnl0ul1Pb+bZj4uYI5zPftyKflTovttllCE2NBrX7XN6w6VCz
         8Uq6e3RGvIlUuahMRP6axbxRZlDCTzoqGG9+4zdDjh4a7+BELA7RRpHa4Ok0vidTRHaD
         Ju08wP2DsoVtmDq1dz3Pg4yhUpm6bngFS9BmOVrRQhojnh1ouVhexKnzXEsFBXARrR1Q
         CjIg==
X-Forwarded-Encrypted: i=1; AJvYcCX0xHBZKL7+dlkNYIAC1HHucXRxtZk7mu05AhHelWaUyOWOlfE2sS8Hu741pNn/WO910i4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3dpzzTchVOs6ciamW+/huQ5WNNWFXXorzGSXTOpTtBnuiZFaw
	2mTEwCZ09dSmuil8edUjYcG552y9QhRjce/hYXMar3bIR99Xs4ujEyn4OdWWFQI=
X-Gm-Gg: ASbGncvfCyKtcZ+UI1yjlY8eslrrFBFBjbVgW+yhdrdlrGTVzqpwenLyAy98a/OIbQm
	j+bO7ewIZyG9pA8YvP6B1yOSKlM1YzSEF9S1IvCwQ7oRo84sJmiyi9bdrQcMaOgq/SU9a9/4vr1
	PWIo5QA1AZLZhnG1znheOPNYbsFzSQMXzKx4MUVKne6ME+g7dkezt9/1a5kz0L6J45+flt5eNsH
	X0tXqkDE1Xdim0BKGwlKhjlxof2y0eRYjWsF13jzhkNGgXLaXCAGmHUJALDL80yBA/eroYlmV20
	AMxr4cICbsc3Pj0p
X-Google-Smtp-Source: AGHT+IEI1HpA9fGHJ1GdkYmfu92FscKbuH3o9L2lVKiqa4D5puwjeIXVc4djLm6mFSVg2XH039gtQg==
X-Received: by 2002:a05:6e02:b2a:b0:3d1:968a:6d46 with SMTP id e9e14a558f8ab-3d3d1f40415mr9808255ab.6.1740515439644;
        Tue, 25 Feb 2025 12:30:39 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d361ca3896sm4764255ab.53.2025.02.25.12.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:30:38 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Xiubo Li <xiubli@redhat.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Selvin Xavier <selvin.xavier@broadcom.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, Carlos Maiolino <cmaiolino@redhat.com>
In-Reply-To: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
Subject: Re: (subset) [PATCH v3 00/16] Converge on using secs_to_jiffies()
 part two
Message-Id: <174051543709.2186691.13969880655903967909.b4-ty@kernel.dk>
Date: Tue, 25 Feb 2025 13:30:37 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Tue, 25 Feb 2025 20:17:14 +0000, Easwar Hariharan wrote:
> This is the second series (part 1*) that converts users of msecs_to_jiffies() that
> either use the multiply pattern of either of:
> - msecs_to_jiffies(N*1000) or
> - msecs_to_jiffies(N*MSEC_PER_SEC)
> 
> where N is a constant or an expression, to avoid the multiplication.
> 
> [...]

Applied, thanks!

[06/16] rbd: convert timeouts to secs_to_jiffies()
        commit: c02eea7eeaebd7270cb8ff09049cc7e0fc9bc8da

Best regards,
-- 
Jens Axboe



