Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB936B99F
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333364; cv=none; b=Rfz2k7v7uGwq0dmMQvUm/CzLzKKFTuk8lBegTLOdRskyOefNbrsZ5UCzsS8YgUsR08jcmcmhM1/vaCio1S7j99+OKFDHQT4nZ/gFLlugcVEgVcezftm57gs8gg4brN3W27jENJIMATCOsX6QF54zOURddeuYlyTSAZ6w3VOWBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333364; c=relaxed/simple;
	bh=k6atjC1oTdr7ZwQ+JAP+shvhvXbx3KJya4cA+9vZLWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDlB5bcvXk2hKkFSSTQYntkzD+NUrsafOziy+nVx3Wvrw/4OQyLVwx0k5XB42iiP7oDik2zwC1t4st4EEVUJOg4OgnCdNuuCBxsJvTlPIMY0TWRk1TqDseg5zqieyU8OLBZWGvLdSCVzKSswcUOFSMQE8VhAdh0KduydjVx+jz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wBbo7RR0; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wBbo7RR0"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-430a5fe0c5cso20522675ab.0
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333362; x=1761938162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9XwB4LXCLiaym4oip8K88EQHxoBTQxTfCvmH5+Ipi8=;
        b=wBbo7RR0LGz8UT2mXM9g828JmqBcspuy2PjFgayeNBBltKdhfrxlh0a8mWuRzjg3Vg
         0xaMU2br48O6wtKMwqHglKQ87CHg5j+h1FXm2ryPEUF/it1Pb6be00G2NqZh5KjAmo8r
         or2/LgQ9+b5ouemHZgFemp1gMRpgkcyA6HcWy7h4uZGvE+e6XP4Ikac+Y4a4iiWRMJ+B
         kJgiPHca+RXUYUj/YAVJ9vv7fcMjF3tB3qd6PyGvBQXvKqrZr3tVTNnIWg9atPub24Tz
         EHxoxdefy6G8gfCc7aRoA+w5rhcGLkKTrr9erb2pUXagEZbe43Nygs2NeMOiv38RK/Uw
         PW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333362; x=1761938162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9XwB4LXCLiaym4oip8K88EQHxoBTQxTfCvmH5+Ipi8=;
        b=UgN6psJ+fkSw9WgNTzDT3LWWaRzZaNwbUSdExdg1fHy+g/ri2F3o73HfVUx3uGhU0Y
         DljnS80tM0TNXjGKxrmGarVRG9+EV/jXnWumaptwWR6Hch0A2v/k2RQ3/HqFtX32rhTp
         2obF50DsoRwcux+vlGPPT1BSnFm1wUt1TiX4IaNFbmbXEfgpV0NIcEkQzWOWHPwklP90
         SMQRcWn61l+h87vhR1XJMjHtBcgd3kV+ecUnhCQxecV+pa0d0UygaiVQ2+MszscCqxMf
         v7zQrG+MQOZDsDlLLqlTr9ZAVdujT/GhK/lfARenugq49eaegRYmCKkOz1fNkiHzI9uY
         4S6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoFge1+mU/E0CBPJe7xKEPnbh0YhS6wzODMlQFBCA7bYmHLGMcclouNhp9jVBqK74+HSY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7jALPSvo0/VNPI/CITDMepyeyS8/JcI+1VXpLEe0XtbGjKPNd
	OUmm724AonSXP3EdcXy3fVUf7kgRc/Hh+e/3a0CZKzkzKrJ5PgjvW6guqeUPc9J3jk8=
X-Gm-Gg: ASbGncvWDUoP0d/tQFIEgyobstAaRaM4b4VOZNryPMjMA1xoE1Qe4iedNmijZvlsewv
	AexOUVuPzp6THLx/YrcMqqlzAaZCQZbRsElB4dcLvjKIveBn+oeJmfQK8FAeCPp9+M70p6oOdX8
	lZ3peeqrfmEXvb7k/YgIOpPwWV2Go70tu0P5y1+b/0kwNy0sDYrSJRV39SqR8RarWA4pcjSIJqz
	L57poKz5xVvsphZusDWdnkXw+ZIQ642uzGsF9hxiy7F0rgtcZJNdyEJXuvmdY1tKxrrxg7tTayn
	Bg3wJswUzFVcGx8K2Qihk9N0CCLh3X0yljl2Lm3ve4E9VjWYaCT4HvVpsx3OUF58GwZK5St8M6u
	KeMTI2E0aBxyKta9l1z7VcSuasluHZie5qGn23xRt1KIGj5FQJnuri1GCxS9vUMW5Uk7j8wL9Wf
	PYyhILuY2r7c4b0Ochxq90ZWYbIPuTUEmkPgboo8RqZOE=
X-Google-Smtp-Source: AGHT+IGDjCZrbwlwcYCrEqEaKTTyt1rgAZl540PN69Agvv1E5bOXHHhIHceJWXZ0grnxWP0ubmH72w==
X-Received: by 2002:a05:6e02:3712:b0:430:ccc7:68f1 with SMTP id e9e14a558f8ab-431ebf6dc57mr41093245ab.28.1761333361639;
        Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 6/9] spi: fsl-qspi: introduce sfa_size devtype data
Date: Fri, 24 Oct 2025 14:15:46 -0500
Message-ID: <20251024191550.194946-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fsl_qspi_default_setup(), four registers define the size of blocks of
data to written to each of four chips that comprise SPI NOR flash storage.
They are currently defined to be the same as the AHB buffer size.

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
four sizes to be multiples of 1024 bytes.

Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
non-zero, will be used instead of the AHB buffer size to define the size of
these chip regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The variable used in fsl_qspi_default_setup() is now "sfa_size"
    - Changed the subject line

 drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 2c030dd6facc7..46a3187b33548 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
 	unsigned int txfifo;
 	int invalid_mstrid;
 	unsigned int ahb_buf_size;
+	unsigned int sfa_size;
 	unsigned int quirks;
 	bool little_endian;
 };
@@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg, addr_offset = 0;
+	u32 sfa_size;
 	int ret;
 
 	/* disable and unprepare clock to avoid glitch pass to controller */
@@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * By default we write the AHB buffer size to each chip, but
+	 * a different size can be specified with devtype_data->sfa_size.
+	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
+	 * top (end) of these four regions.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	sfa_size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
+	qspi_writel(q, addr_offset + 1 * sfa_size, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * sfa_size, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * sfa_size, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * sfa_size, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.48.1

