Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1A1D516F
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 05:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213813; cv=none; b=dHxRN49jvU3/mdvD7PDlVRW+2GL2nkdfibXgyt1lPH83s8IBnrMHp5IsEHHeEkz1bWuAXgqI/XpLDIlG4SQwS9DNYULcp187j202J8dFpIGGWkREK+cfY2NIs5YNFknyYbsgFCFBRpM0OQrCt4Ue9aMpyhyXW+5fv2F8DP0tqjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213813; c=relaxed/simple;
	bh=jd5oGOx/Si3BQhqWyzuRg6hu/nzPXuQweQYGrnIy6Fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VA7E0Z22y170cHj1Qk3NCl1iaKW8OiXBVAuIJ+uusQx3lcoF7fY2QnWhG4almehdU2cPB544A4QHURJgO6J4olyJPPqoqVDO5k/Dr78Jobw3iZldtea8tk8RqFpEB2+gFuAOP8xEZklCe3+2zXvRtNh1yYjAM3KOKprzW2ZDh5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d22tkrAk; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d22tkrAk"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2780112b3a.0
        for <imx@lists.linux.dev>; Sun, 20 Apr 2025 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213811; x=1745818611; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=;
        b=d22tkrAkni0fT/z5pBaMIXOun+l/yh1s6baeIDFABCmr9EmcVlOci3ShODXlgVOaem
         vW2bBffYbUjXWOkkKZWLrghIMwufVDQho1XbhzfZhARm5CfADcttg3j/KB0JWs6fJPtn
         N5MDR/UY1DW/RqRx3R+1ZS0o5Mh99nVdexEu7mQ1ELFUQU9O6FA8jZ4gLV3N3cEXv1ao
         9D1t2yHF0G5sf2G73Qxz/5oMHIdabzl8PerVDrJ/LjSPv7C6Xzbuzo0u8rU5ZHmfo3hQ
         QC32KleLjsoa7atjd9qv8ikl6XG9tY+rdV5IjmDsyF3h3Vm0hqdRaAdhJDAXWAUSOusd
         hPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213811; x=1745818611;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=;
        b=QVcEPco4DrnVHYnQAJg72ghfQYStB20uMPj+pXj+grH8XJ455NAn9P2oqUqMuFpinO
         4rMCbq3ucGn7IvA+oEi4Bj7b+zlyUpRrUgfapNx+01pI2Cjggm+erOgSgV71ohDgKmZq
         kr73PD3t8+swY0qfGaDLTfWw3t3/n5d2KpaWueJSdbfHirGavOAjQbgJubNBqUjuKafX
         j5491skVFnLvsnd9DqbxTFlhNDstgieQwF6sE/LMt5T1OE6DBi9uzUCRk9ysL+VF7dYt
         nKoeGZtZ/zAPRddqx3lZgX+5EgHt2S+yZ4Q46nHcJTMIQsSyq3zE52Fcw6iu7jjg6k7z
         m6hg==
X-Forwarded-Encrypted: i=1; AJvYcCWJshcAgP+EL5KlPOtUsatNFaOdqJqtLe7f3CMscUry6xYjqQRFC9yU695O+knPpzNbzw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEybVneeOIwU89eULnJYGs2TBQa/a8Zk7RIoexln23Nk07b0Ml
	evIt+v42+LEHVWkjiTIefcNGJtG4D4U4t974LgMoO/pKovbo6cPWbPpf4pkI6Jxp3Oyx
X-Gm-Gg: ASbGncsjJwAcd2fCUvP+RCy4jp/veXpIP6Rw8OXCkOj2ieJu4Nj6MHAfGYCn5lq5ilP
	xeL5sXYhP6ixliageJSm+Ri4rJhIZjWwz41BvmzTUoUogEJtbk1OjFeT9c/GZJIba/sQsM0T1IZ
	s8MUU7oXp3+6SMUP3rX5amEYlc5elk12tYy5CkMf4rlrNN4sBHYLQVm2a29/qBcdKIp9wP93pV3
	uOELos5XDq5TxblYzOVxweP1aKBs74BufqH97trcWvfv0N8xsHHwu3PWs+R3ObWA1g2fxxNy3Qe
	pyGwQn1JxGO+ojjbqJmLg1xf
X-Google-Smtp-Source: AGHT+IEqHUOUzK9rh3J+NJTMwGu4gKoRvfeJw0Sh1VhcSH7waFXHAmJiBxIoiBwRq+DUpuFuKqUz/g==
X-Received: by 2002:a05:6a00:4606:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-73dc14d3124mr13013679b3a.14.1745213811299;
        Sun, 20 Apr 2025 22:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:36:50 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH 0/2] i2c: imx: adapting the mainline
Date: Mon, 21 Apr 2025 13:36:37 +0800
Message-Id: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXZBWgC/x3MTQqAIBBA4avIrBtQ6Y+uEi3EmWoWlWhFIN09a
 fkt3suQOAonGFSGyLckOfYCUynwq9sXRqFisNo2urYGxXqU7cErkDsZyRhqW6K+4x5KFCLP8vz
 DcXrfDxlXioJgAAAA
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=809;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=jd5oGOx/Si3BQhqWyzuRg6hu/nzPXuQweQYGrnIy6Fk=;
 b=TxNveZGO01XjAtbsV0BKVuLJNalcayVMoh5gzsY1Su3nli5TPvpvv7Edu1GqZdmBjy9whtRWt
 Q2gGB+1aSJHD3NMjOf48wZt8iGFb5JQy3/1TcqMGOITcFQvAiSyYTgm
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>

