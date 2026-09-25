Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07113783D5
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790301824; cv=pass; b=frUzNw8/PRbL9sEvOb8DBKorCBUo3T2Z8LG1erUe7rIUFmLdaJb7sSgU3UYLXcUYGUhAIlYy+Hi8Jof4pH4c/OkupJegSjngqP4YtNrbvFxABwkQQ64MMUh60pegxUrzF8sGo+fFUyelJzCV6nQCh9OoyPwnT6Yl5/uMfWyLah0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790301824; c=relaxed/simple;
	bh=I74p1TPOpyMN5eN8javYXxz6OzoRysS3odlBNtVBa6U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aCOEI9nagMAIapXh5q9sesInusEI1jPFGlJkrkpt6BhsmEDUZ63fBku9aGEAJyhIlA/6lAIn+94mX7C8MgSaJCX+S7MMUrePD7K9rD21FRONwl/UiiYh9L0qu9DDtCh2tIs/K79Az4+5DAEFyoviBrefPlKWtg9AK2TmEOFV0t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ohp4Wija; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ohp4Wija"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso880296a12.0
        for <imx@lists.linux.dev>; Thu, 24 Sep 2026 19:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790301820; cv=none;
        d=google.com; s=arc-20260327;
        b=rLIEDyL+IsR+zMRBwtX1aoBFru53e0Xme8r5POASGMY2+ie6DWBA9egKHU42yECAfV
         YcR+hOCViUOdCLKFw8k7t6vbHbVDy+aFqXoHSxTdSpsVL+JgIBcGifFQDpqjJLEVCecK
         2/CDVhoMwuBCHSMQlg6to14XAJDwFQ49xaOToZ1liIv+UznJ9RWtm4P+FQfWhWicXdW/
         g6JVvmQwT59+kGbiL1tHFdMsj7IXJYup0nRVHmb9blP3iVRuefyz8K3sW/6CcWIl2eZx
         H0jUmRe42SWxAzS2e3ieOgAMFcVGFBOZpNQNKTL7SR09UqYXkMZWD/CM/ScXkWJgSgVN
         X9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JXqpBsOJVxozVwjvJVgqPsuZqPEgDFWhK/I0MbzqS08=;
        fh=yXjkw9tWe8Eaf7jAJrqCT+6fgtA6HoJB4e3BoGu77UM=;
        b=RHo86PGbji8M1eT2CRxv0N61Z5I7WSmqLf9tfISpqPJhcGBIPZ2S5O5+PGnklcXQxb
         I1KH+VsdKvrQfwdg5WZuMwN6fTiyvTTg0dcYTUiGiN7T27eWUZDVqzuPOC0bzY4GNpv6
         AxFqg7faK4tigbvFJkhd6WiSR9u9jCsv+hrNBrBNbjfb7WYhXDdFnu5kZOfsr7tTMAvy
         nUJkTUUW6AVJmcQsr3bqDVsgTffgvr1Z05D9h/WOnr5vI6SojG7TQ4qWM2aB1bIqdo/e
         U0TTEWGJl6CRF0Lo0FbBtnyxzkyrM8cGsLknjmiQPQdf1tKo/vn0ezJpgyrMZuVf44Ux
         PGAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790301820; x=1790906620; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXqpBsOJVxozVwjvJVgqPsuZqPEgDFWhK/I0MbzqS08=;
        b=Ohp4WijaOqoQYE4121fxDVRXQm0sDuElT/nOH3b66ZmtOS32PP0+DB+Y6b3W3XnGWD
         T1+m4tjwGDWFRbCPOGxHHlRdEzcetHDmycCNExYyo5/bgryIjQvI5YIncq2ColZqDVlK
         Wp8KvXEPz/oS3O2LyRJNohNNSYIP8pGuT42WyAmOtlu5zmes/Xjqs/uPMhTv150ir+WX
         b3qqDoI7UDwZyX03FUrFvSDgaKYmXynLUO65PE3uKCpmw+JRdm+szeDgRfd75nAd3Hkz
         7WXuttx66vEsQs9STIlfy2OUil1uZcICupH6xLO3Pd60jiIzKAEHAhQiQo3tadDgK5/U
         yCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790301820; x=1790906620;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JXqpBsOJVxozVwjvJVgqPsuZqPEgDFWhK/I0MbzqS08=;
        b=RoLD5n92AkcrJeHyl3O6gJ+xMfhDxmKhTFa84EzD0ztjMcXt6OECY2IGG5MlHjxRUK
         GyV3rVZXN3PqmPbEgn97ZWp5bkudjLWPjUQHAaAmJmWDUhtTiDK6bLEuH2+H6qmpFjVU
         9Qz1BOxCGXDH1p27h1DiCIwlkrf3CewvMX8+ol1dZMDgMpH5Ym/ymfWIIlHifV5/l5WP
         voeLfx/JXqnMZSkIfkm8CenswLG8BWAa2jtjl9wibJZVX87tLysdtzFTsGWLF4duw7x8
         sHr/37dsNDVbglqZmZjP1XYKokJCTjmxkjlx1fk/PqungCIxHGJ4XfbVa+02fSjPY0L/
         v2Sw==
X-Forwarded-Encrypted: i=1; AKwUvByBdjeM2rt3cwsRwnRl43Axh15FAGcbOO2n+Ts57cm3qDkbrMlLizI+1N4q0Y5VZ6ds6QI=@lists.linux.dev
X-Gm-Message-State: AFuF++mT0ig0QtaZ5ws9VhX2Cnl9wCct6dugGPdypQtPN8t5N1K668Pi
	dmF0AWWYG8+7gWAdWW5fjjkAFVQ9f6/cRAxuYV//ZPvTrdlXgwQEXMK2T5ofTUd6g7t3x3VyGhZ
	ypofdq0oJvXZK19CR+X7rM8fmr3wYDQ==
X-Gm-Gg: AYBFou1kVMbJd9ccxz3+lOyEpNicOkVNiAhKCn/4DUu9F9e9pqbsS54K6j2GRaB6qzd
	o5vJJXAAdPeYYt8Xo9KVML0RHeKBcLztjLMFYZxsrMEgVGVGsB5zBGgmbkAjfAZH0TElR4P+y0V
	PDZ3c6+B2FbwZtD9zUXBMyIZSBfYhTLoH0JsDoAQHNtcgTnh3bnfEVSjdo1A2TwRgrv4cpi9tJ3
	QUysh84hLVJ9eIc+9nQX8k3jP/xZ+W14/7QAiH6r//c+AVCudUsNaJ4CzWAbJyetyjnczrdxHPa
	2P4xCQrvcDijDaQVDIws4mBW9SXv+aNVk3V75mB3JIdj2FSqHFgDL/VUt9jbAs7Q3HKAeZNZw+u
	5bcbadiyktJ2DEBDFaQ6F2iAFz9wzjE/JxZWTYTV3UFa6FC65txkEQz60Xc1/RS1mWA==
X-Received: by 2002:a17:907:e918:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c2ac2674c23mr365071766b.45.1790301819967; Thu, 24 Sep 2026
 19:03:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:03:39 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:03:39 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 21:03:39 -0500
X-Gm-Features: AclHuK-CLL4CN-iwpmzU09ZJTyaHPdgpyfiVO316kD74pCcGmQ449hidnQgH-fE
Message-ID: <CAGEsz8EYe=gBFr_hEYFLUeiJMRtau=eV3cDUUmHJOQkC0qvfqw@mail.gmail.com>
Subject: [PATCH net] net: fec: drain PEROUT requests before canceling the timer
To: Wei Fang <wei.fang@nxp.com>, netdev@vger.kernel.org
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
 drivers/net/ethernet/freescale/fec_ptp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c
b/drivers/net/ethernet/freescale/fec_ptp.c
index 56801c2009d5..67901e036ac3 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -506,10 +506,13 @@ static int fec_ptp_pps_disable(struct
fec_enet_private *fep, uint channel)

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
