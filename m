Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA172314A85
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 21:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860477; cv=none; b=CQxwrUZCdVUeWSywNWn0tgFE8pRPjYnsrGtAENATBDhfGVCIgi3Be0ia21aTEIYnu4fLlhecjiY9Z8auYTnimP1yeGprlOs0wcoYyDysxh5nKMzprpuwv9O8idqx3J55tEHhTmWjT1oEiuuWtYlGSK+X7v9U5FFYrc7W73SOaFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860477; c=relaxed/simple;
	bh=BL2gcDsqOsH/kUfGx5gIYSBmw9tJDe0SyiHyKUxzwmg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E/hhHOxaobic9ldJkR8QcpEYstflTbXkFihLfvhchTwFnKxE52vUbbKDvTHsNcob59k2LBf+bz8QGLavJn2p9sDPLj18UlB6uYb14yC6FDcKP+mEpWz7uh2Q0PByXJxOnBBQvzAatqGtfI6/BNUPqt5pZWuPbFGUymaaDNW3tKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxM/59Th; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxM/59Th"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so145914766b.3
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860474; x=1762465274; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ck2ZSs5oFDctNEkipq8C6FJLeHmWTqbX0DGm3ceJvfc=;
        b=gxM/59ThjSWzK9wpW4hrWQLXVjNuje9IKmn77CYltuLBtD926ie4HqXWOw8CycGaWV
         PDd68nw29r1/aVj4xiNl4zYEclA7sMgVcwiQdCZzb2hwh2yn7fJWyoPSH90ezrDESSp2
         0fmovK6AZ4xfTIJTFgtJaQvFBWAkjNeRci6GWu8FMZ2A8Ti1OrQeyVOXqqhdKzYstAhH
         wgjc+rpsqypCFL/pVWa+nag/YCACUcIb4y0vsC0/03rr4G2/dq1yVTXKcyBlcUWNF6/N
         e5IDNQjbykojARXxFskEoVWBmkUEqc9JDaOVAmdOkm5OcH/+ag54cDWycYJ1Fl0qkbe9
         XbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860474; x=1762465274;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ck2ZSs5oFDctNEkipq8C6FJLeHmWTqbX0DGm3ceJvfc=;
        b=uYC9hJ3Rwl7RHNShizUvFCi4b12tCqNDhPGIYxrpwpOEO/18xCpT1n1tLClhb2KFwu
         9W0E+DdFQ53gTnPxMxHUp1oYayyGHttpeslkRhxuv5YDYb/Ts55TfL/xpxga9a7tyU7d
         E/1xz2ozNAE9XqGaK+Ne388P+C0DozigTE+yI+7G7lFyKVT2ZfpgRsEKn3eFwfZGPrr4
         5LJXzZYcHPOqwghFu/Q4H+4ulxmbiVxYJYbIx4WJ1m4z+92/em4F1PgSi+y3huwnIqVH
         WLhBd9LTEMW13hFkAdTyqUC4+kIe2poa46oDDKdjIjHCBrxt7pd7VManSCy69nTg0okV
         U2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxR8tlFfPgnShvDPcw1kAM4zF+tHFNcXW2ukS+TvUhkEzAcLRQa24FlsmnL8PoPZ9/wDM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrm9r2QYgXXwn25fn1Sj7Ims/xQcyGj1SkA5JGKQmuuD+/g79U
	m7Y+Xl0GMyVLl+T8aiMolsg4N/VZ+e2On3DcABLY5jV16bcvIj5lIWjv
X-Gm-Gg: ASbGncsCRteJ8RGM49VkqvDDMT7oKTAFv9Uv9JZvC45UdbRwif39RehouVAHgIfSuzq
	ZtyDrYC2oxS97JzGnJlD+jC1Z3JXoIGkGl0/nwvv+DJsfOcg8xgtzypZEhgyedE6gcsW1CKXY1f
	umyu6IuomXK1r6Zkm9vpn9jkUvHXeebk1sm1gSeeF13IMPGuJ5I22p0bbxW3K1ATDtUZZ1U9JcV
	O/fX2LEQKSZnzwLXemDDnhIC37Eh4xoacT9Wha7HXkKArcn/+UWUlHTNC3Uq4Oy1mXRrX+RoSdt
	kS0yyVt33elm02wIK3+Nnw1dtgxV2dUAVmhiWehFu5L5sm+w1qsKvwmcIH7M2CWNdy0jtoCJa1b
	Ao1L0C7/Pu6WGqNThoy4cUT5B48Erg2riCDR2kPgcRB1FklNM5lUjPVG4emdanHlHfAtThYxH9H
	3BeHWWl5EirdSlj9H+8N3+SsYkP+7oW13zWEkUn8HHDlEub/0yyrnuBc1kOf3iXBkYG9zQd91Dd
	1iGr9K9AafjoSBFkDSoFaztmuNfM6kQzOk5gEeokeGFSzYYL2LD2A==
X-Google-Smtp-Source: AGHT+IHjonNJY7v3yBQd3MV46djU8t/giJRgAZF/fV+bC+xHHeZMkRdA8EB5KkWvu5NDjQA7pOpVOw==
X-Received: by 2002:a17:907:6eab:b0:b70:5a76:d3e8 with SMTP id a640c23a62f3a-b70700bc350mr112939266b.8.1761860474010;
        Thu, 30 Oct 2025 14:41:14 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d9b536710sm1514947466b.57.2025.10.30.14.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:41:13 -0700 (PDT)
Message-ID: <bf564b19-e9bc-4896-aeae-9f721cc4fecd@gmail.com>
Date: Thu, 30 Oct 2025 22:41:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/6] net: phy: fixed_phy: add helper
 fixed_phy_register_100fd
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In few places a 100FD fixed PHY is used. Create a helper so that users
don't have to define the struct fixed_phy_status.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/fixed_phy.c | 12 ++++++++++++
 include/linux/phy_fixed.h   |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index 0e1b28f06..bdc3a4bff 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -227,6 +227,18 @@ struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 }
 EXPORT_SYMBOL_GPL(fixed_phy_register);
 
+struct phy_device *fixed_phy_register_100fd(void)
+{
+	static const struct fixed_phy_status status = {
+		.link	= 1,
+		.speed	= SPEED_100,
+		.duplex	= DUPLEX_FULL,
+	};
+
+	return fixed_phy_register(&status, NULL);
+}
+EXPORT_SYMBOL_GPL(fixed_phy_register_100fd);
+
 void fixed_phy_unregister(struct phy_device *phy)
 {
 	phy_device_remove(phy);
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index d17ff750c..08275ef64 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -20,6 +20,7 @@ extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
 void fixed_phy_add(const struct fixed_phy_status *status);
 struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 				      struct device_node *np);
+struct phy_device *fixed_phy_register_100fd(void);
 
 extern void fixed_phy_unregister(struct phy_device *phydev);
 extern int fixed_phy_set_link_update(struct phy_device *phydev,
@@ -34,6 +35,11 @@ fixed_phy_register(const struct fixed_phy_status *status,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct phy_device *fixed_phy_register_100fd(void)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void fixed_phy_unregister(struct phy_device *phydev)
 {
 }
-- 
2.51.1


