Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4642123A
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877793; cv=none; b=PkS1PectL6SHdzLP/ZZp0AaoTUMGUCzgTFCJe5Nj5ymWb8fbSbklyRLzhteOLsTDIiHB5KkJbx6NMou4/E1aTaH6NkjKN8q++IenbsPI05i06DNSOU/FgaOCTDa8WortYRjPFtM19bazHhw1eTatlcx4VnJ4/yQAvAc/ANpzq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877793; c=relaxed/simple;
	bh=vuCy3XNQRwK2pAv8DV9ohIZ4yjPKBGFN3TicIXMmLpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ue5Xie6iE+32FqmT3G1YL2vGT9LLCX24vKa+q24oUx+PZaYqSZrzqd2rY0qfGTXv00m+p2DeNir7fWcweVfwSYp7II4nEUbDq5vYEPEGcOsLc/GIQ/NfvNFBf9gNUb64p5x/2st/2MCGwNO6Px6o71hcgJc4Pc85yonL0ehbdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoA8Sqcz; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoA8Sqcz"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-67561cbafd0so2857271d50.2
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877785; x=1791482585; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSRI8/Iy//RZIheBCqOOgWpv3l9S3TrqbEtSt4XD5L0=;
        b=JoA8SqczhAKRgbLyuHyadELEOQiqIvdIJrdsr/Zt2C+73UJHArC/LJI4PJNO0ogLd6
         TEvZi9JQp41ASU0ApnB3n3NqY/quNPDpRjU/e1wyMcdBmH/epCVcvihYukhkfOIcuFoE
         1cTyMtnwzrOcNAbAhpu8rthVlG3V1kiPFQTd9mmipk8M9r6+EWHlvw9aiuTnQ+R9UZ/9
         52DtIecXlG5StMMRaeLMMsX9YKU/cLZEDaLODyjAEr08Dejanzjod27RAPX6Z1oFybdo
         BdEtVhHf7otKHKP183NqQZK6wxl2oHgi3tUGMCDVKqtW+pkhyjIw3U92riqsppIf9RDv
         7qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877785; x=1791482585;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSRI8/Iy//RZIheBCqOOgWpv3l9S3TrqbEtSt4XD5L0=;
        b=x0W0GUCuykJ8TAyUvgVVHAeJeY+2oYK/C4x3kywjk8mmfARbs8DkQAyHtRqdIOubb4
         Rq65B7bBTfXKmz9r8ieFuCSbdd9p4R76ux9uVUjTP09kC8Cgcm5foPMmYeF8Q+JdqDix
         LYeJrh/yoFsgAsXMMXs/c9hX1xEa4t0YXqvComKC2lZwfbqLmfN+HK33UC9LGrJGWZD8
         8RaXEXtc2iJF0WBM9APGPGUbIajzA7OKxW/EFSuhzkaDf6R1cVM7UBu2STVg/YOwPhvn
         4Ki6VYwm05bWN/l4Cy3zbz6TM2OB8L0eQpYYiW2000xeERgXD8I/jL7jj0LToduO+g7O
         3KMg==
X-Forwarded-Encrypted: i=1; AKwUvBx/FH1XuB0JPPkiQ2y14aB1oPvYInWo+V+DCelAGfBM51fIeKVy1BRaxblJLJRg96dbHQk=@lists.linux.dev
X-Gm-Message-State: AFuF++kepfGjJlCstw87qGLLlSEwErSL0VTpaneAsjYZ60mnWDqYLjIz
	k7FHz+4PjOg2fWLz59fKBJs6fSg6Ez+3TG2yBWt8T6eFTT7lV38I8IY=
X-Gm-Gg: AYBFou1BHXVu1bfaEPyPboNojcZjFpCRMs6qWputRA6fxgFHDdP50+2gLD5TB7+R1n8
	2GKCIKNGD8RTTgP8ye3vroLHNjiMLiOHl8bxdzG7WNmIBEjOM0R4aFQvaxt20eQN+NO1MSpObSo
	76/27FAdcUKF+Lo9hhUieONqfUQpsIi1okQgqZlGXtcit241Bujo/OUyspT8RxPM0vkOf7SWxXC
	TlS2SDax2Mvu6xMfI2j88It6nQqC+cjz37CSSly4sJvcOUItJyfuHgjMhNXNb2zxeaFLQS0JOUB
	cTTdPbe1cUMfIG23STlf36X6wP9u/NKlRma3jJYLg0IzgCQXI5zPDUXP7UXXyyyaSyM4LdBNbm+
	jF7pwPHUg2r4/9lKrOgV7PRtpIoxpq8h7RvgPOqxo4KXim0+8oh16rh7wHfQExfIPyam3JGJJWU
	qd1QfN1FrDZakbno+oGgqKbKsSGj7TpiKOcQCuiyQB6/H34WvKCVh5k7IhP3/M/37g4Sdzh8/PB
	JHvlUtPmLLNtIxOjq2SjStj2JWfFcNFtCf+xmhzSovHjmRtyelHOYS97Kf0x+Z+iYjS+6O5pBRn
	N8XCS8gPqjJ7Z5M5Aocj3+gzc1CJ
X-Received: by 2002:a05:690e:1513:b0:676:858d:35d1 with SMTP id 956f58d0204a3-677ac03bb85mr68872d50.36.1790877785206;
        Thu, 01 Oct 2026 11:03:05 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917b200fd90sm20983806d6.37.2026.10.01.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:03:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Wei Fang <wei.fang@nxp.com>,
	netdev@vger.kernel.org
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net RESEND] net: fec: drain PEROUT requests before canceling the timer
Date: Thu,  1 Oct 2026 14:02:58 -0400
Message-ID: <20261001180258.4054391-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fec_ptp_stop() cancels perout_timer before unregistering the PTP clock.
A PEROUT ioctl can set perout_enable, release the driver's locks and
then be preempted before hrtimer_start(). The unregister path waits for
that ioctl, which can rearm the timer after it was canceled. Removal
then frees the netdev containing the still-armed timer.

Unregister the PTP clock first so all in-flight ioctls have returned
before canceling the timer. Clear the PEROUT state and compare channel
afterward, then disable PPS. Serialize the channel write with PTP clock
shutdown and skip it when that clock is off.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 350749b909bf ("net: fec: Add support for periodic output signal of PPS")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Resend notes:
- Send via git send-email over SMTP to preserve diff and hunk headers.
- No code changes from the previous submission.

Previous submission:
https://lore.kernel.org/netdev/CAGEsz8EYe=gBFr_hEYFLUeiJMRtau=eV3cDUUmHJOQkC0qvfqw@mail.gmail.com/

 drivers/net/ethernet/freescale/fec_ptp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 56801c2009d5..67901e036ac3 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -506,10 +506,13 @@ static int fec_ptp_pps_disable(struct fec_enet_private *fep, uint channel)
 
 	hrtimer_cancel(&fep->perout_timer);
 
+	mutex_lock(&fep->ptp_clk_mutex);
 	spin_lock_irqsave(&fep->tmreg_lock, flags);
 	fep->perout_enable = false;
-	writel(0, fep->hwp + FEC_TCSR(channel));
+	if (fep->ptp_clk_on)
+		writel(0, fep->hwp + FEC_TCSR(channel));
 	spin_unlock_irqrestore(&fep->tmreg_lock, flags);
+	mutex_unlock(&fep->ptp_clk_mutex);
 
 	return 0;
 }
@@ -856,11 +859,12 @@ void fec_ptp_stop(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
 
-	if (fep->pps_enable)
-		fec_ptp_enable_pps(fep, 0);
-
 	cancel_delayed_work_sync(&fep->time_keep);
-	hrtimer_cancel(&fep->perout_timer);
 	if (fep->ptp_clock)
 		ptp_clock_unregister(fep->ptp_clock);
+
+	/* An in-flight PEROUT ioctl can arm the timer until unregister returns. */
+	fec_ptp_pps_disable(fep, fep->pps_channel);
+	if (fep->pps_enable)
+		fec_ptp_enable_pps(fep, 0);
 }
-- 
2.53.0
