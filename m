Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC73BED42
	for <imx@lists.linux.dev>; Sat, 26 Sep 2026 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423781; cv=none; b=O4aFBK2lTsWAWUCt/AdXyZNNCeHg4IWoHMks/9L0wV5Bv/6GNWAESSieE0BvQiX6K3I6xTLtnP9YT73WHAdMwlIUfRPl6dkPaqIDduXMh5gZz+lUApqmk9ptvCK8qelLnNHMYq2bTWw9UNx0F/tkMEIQbU3ocfWSWwmPMnqKPtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423781; c=relaxed/simple;
	bh=p/aA3q7dGb6rMTLZdywmMWZ771K7JU7OE4990Soo7h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oN8dSWheLcM10AZz5azZ9P/oydPDE80ur0q5Ja8mnQL/tEG28cAz2sfWcq0feDyxtXDY6GJKnczuqLmT2R080V96LeZrDCg3ATy/7o1x2rGY6doCTdiVIoy5dyb0UFyZoGxWEYk2BSLlQ1cPFTv7GPWsj/PAVD5YhCrDelWjc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqbQrqUx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqbQrqUx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso3385555e9.0
        for <imx@lists.linux.dev>; Sat, 26 Sep 2026 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790423778; x=1791028578; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjEi4VNevqX9s+v8m/m8iSJ8qE2I19ueR5QHAcHq+jU=;
        b=nqbQrqUxtYD5OxejyAZY5zhMx3rUXtsidBnTkpHowIMbdlzw9FMwWfyb0BANKxW/KP
         /w17W3oJCoK9JY+o6+zqwv2a5uhXLYe4fAn2vrAUb6lz6aSa+iZ65QdbXMHWXJxBZUBr
         po7/GMJPHsmkHk05dTZmUKUC9dhrZnFyDAKMp4ZSc2IGo4kvp2C6KzBra0++XRyam3N6
         ArbCNfI3oPbhbIB+Cjt4wztg7MJHDjTlALmRb7IPC3ItYZBBbv5i+s7uxNlTJWq5U1/Z
         qqMmKurG8UdGa0ARp5gd7UoCVYTbzNulFWFzy+HmxLY4Yvh6SmSa7tEeqEVBTo0Lmy1M
         2b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423778; x=1791028578;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjEi4VNevqX9s+v8m/m8iSJ8qE2I19ueR5QHAcHq+jU=;
        b=Jl3uL3XRfOG2xvoxTsrICirujRIw/+/eczMG0ddivZLD++Mgkk9lCTkpEOqNR1JaJm
         /H7CiQ+PDhl7lMnWJQgkxPS2fIlDSDcT1umjtadO58/aZ9isv50wiHYxs7Hh4DxPsyh3
         HuQY4Zda875FO+bjwJEgiOmMEFmuFpahbwVbUuUHuLhW2+yofNJ201w1HBhmo3fH4lz0
         hrlxHlE9g7rEGTB/StRzkrrSmdRwUufgxj6dhmpJ5kVlzVmWPKgC/1j5cBDg4/bu+MsX
         i9iInnH9/Tj5LqPVhLKftKvtZmB4NcVcOKD9D26RY5WcdfqzbOdE5c8+yP8qaaW69oHW
         V5Hg==
X-Forwarded-Encrypted: i=1; AKwUvBykXHiSxNYMHI9OmPf/yPdggkfD3/gEvVjhhQO9CKGNGo/TjTGDDGzQSLyv+g3j8PkVvPU=@lists.linux.dev
X-Gm-Message-State: AFuF++k4otyL4xxRfKK3Tz0g/TpHH6cohDjs88xW0ad2Af/0LgbNTVK7
	6FetSRpCK3XM/k+reys3jTxnLTST40kXHSvMJX3jbR30mfp5a0KA/OnQ
X-Gm-Gg: AYBFou0/1+MwbvdCSOHBpyrW2Oyo2zh4XVirp6pezrBr2qy3tExyWiVl6RaD9B5M67y
	+SCyEDOoWuZ+HZfnH1T/p9nCWIycRGfB1EPZEPjHWEoIcBp0pgWsV5FKTUgJyfG48eiQkexj5yT
	C/ZsYZK90hwcMDELT4wXTtg+xpsfYoHCsrJEC9vNtctOd1iX56IWQHKK7BBzc/Tko3+Rx412laH
	6J+UdAQ0Yln5/1ohiTWp+DnTmxx3sy/hAOqdqwhTqWduo7aqE0l2Tp/Nigz0owzBrHGinH+pcZT
	JRYTzZaY/5kCWLmj23hYSJVk09Ggj45/x6Bk4bN0oRdtAKxbc4aXephH0DWWL+hzabC7DIOYjgA
	LpWLDnJAVUTwXDvVoCVFyEXD0ZjLfIbqxRFXQXXj2ZU7bvnm/XqRAdG/bGHNxZHOiJnyU1Xb7oB
	5xyzRr2P46EQdnR0JiFtNv6Cl/4Tj5h40RJU62p0+DOwFL4OeqYSae0Jzxeuxp2c8uV29E8GFyC
	VpD8Q==
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr28010155e9.13.1790423778140;
        Sat, 26 Sep 2026 04:56:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm171071455e9.4.2026.09.26.04.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:56:17 -0700 (PDT)
Date: Sat, 26 Sep 2026 14:56:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: enetc: document enetc_msg_vsi_send() return values
Message-ID: <09f24cefc214455305543a0528ceae6349c77419.1790357822.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Smatch combines the return values together and wants all the callers
to handle the positive values so it leads to static checker warnings.
Add a comment explaining the return values.

Generally functions which return non-standard values should have a
comment.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_vf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index ee9567998c7c..f70b6d4290f2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -48,6 +48,10 @@ static void enetc_msg_dma_free(struct device *dev, struct enetc_msg_swbd *msg)
 	}
 }
 
+/*
+ * Returns: 0 on success, a negative errno on failure, or the positive IP
+ * minor revision for an ENETC_MSG_GET_IP_MN request.
+ */
 static int enetc_msg_vsi_send(struct enetc_si *si, struct enetc_msg_swbd *msg)
 {
 	struct device *dev = &si->pdev->dev;
-- 
2.53.0

