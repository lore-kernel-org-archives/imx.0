Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581447;
	b=UNLG0YIk8xLt+VijFnAY1KTfpa1gYh+qy20Uv6z1VdRLgA9OR/PvyLaSZe6TGx3qV/YJ
	 uT7EPOFsPkjKx3ubjee7a4lBwOZBQGY+SRVLQsYppU3k1/dmBn5nj85fm+es3mXW/hGvW
	 y3XdEUYMOZzDVSU/e9wbUgFToDUv+RZdJcS12hlOcN5BHNnAjxHKMg6C5Lvdim2MRRtAc
	 Ksba8OC9Rdhh1FRGM8YB2QnSPTY69ZXBwp1OcL0WCgnnIj52KJ5AYyPBGG4ST4HKSIiX1
	 aan3P3XEtArqVPJKua/eq0VxsZHCis9rctuoUszg0nQvC/Jqk/ucyaSLZACB8DTzz+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
	b=TJMR6OO/plH1okvs2bDSoP8F6SmjgN+b8pomB71/RQDjOyHE/qvA3xgzOnb895ZUTaQ+
	 ePdu4LcLaw1VkNa6kriaR4Y3knd9wUjEi2w74SYqU78g48A0TY4VLw1PUMuWSxcFgZYXI
	 TApmmScMmJydvyNRGHPf85R9vRkqOQzSzNJvE16yzSWY2fjJA58D3I72A8pw5FNaf4lG6
	 gspLewq5mdiJV5N3FcKm3CAsSLgCHCitTUQX00VJFNR9WgfqnYnGTIpGNB27cUwq0iWV0
	 gYnUMPseWJY9CqlQCgzBoG8//OxzyHZ3/PIZDxSmF31uettZrYQ878+8ZT+Q/lgFRAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOc4jcz5;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA465606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA465606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOc4jcz5
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so2592116a91.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581446; x=1796186246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=tOc4jcz5H2RmLBRYlEMoy9Fl2QqYPzFCQIK/TmjdIjRfbQZhOh+SM3DOZ/8pjek35z
         pBmXmJKfcthf+DwJm5pUYjOFmqjQKKq6ZN0WiSfFEvpLmJhdAGt1qomADKCoM/7lkXd8
         MS5IzeHFk4gxrb4MQeaFlhu1YfVw/Y8yhW7EB/c4EKRWD0rVbpUydS5suwMcqLRzQfTE
         yq5ysL5AZgVjOACinfVKtF5EVqPZV6g2IytD3kiEDE+Irhh+N6w3OT0BVN0q8AOlLt1a
         8jB7nlO2BsrbgD6tMv3keYVhuz3sqW2ClRG6yOOtnvG1ZmaKqiUBgvfyUf6XB2u0S4EG
         /JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581446; x=1796186246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=Fzf3U5dsGdUp0gqDLEDxsAu5vr1FBDclIu1Q8oFIHtlOcN/2gRiIPORIIlUHPEprlf
         eAOR2Nk7clv4+VOwxv5lNWBuPlGvtWaurK4PvdM9K2XXCPoymKPqDivtNqP0JI6s/7xk
         QMIMKUEdOrAuxlNXpPY3Hiwtxbnz9dHzvMDl5pZvLrblH+raxbIJdafzY+kMVOGCCLM/
         3EGDBmmg/oT9XVRhQDtPJ8uu5fvURiVG80M9VBEF1v3O/eCx/COM7j/JRQKe8kM+u4IP
         7iu3faNz0IXMyhp/+dgDDPjWgzq9wKH95XHjR3QFzS22w5tDqo2TH4IuOTvo4jzkH+PA
         xCyQ==
X-Forwarded-Encrypted: i=1; AL+hErGItkTsP1Dhwpt2axgikh4D2CQGnHkIdiSVcl4naJ4PmdwRUn/Ab3d6c7cVy5yXQEmT9DA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wGqtPZZNr0uXnzqSU8J1i5/T6iqmejXDycmam9J1k30WTbuLQ
	9RpJ/BNrP4cJp76zQNkP+62y8MkHWIuQU6dBE15Z3gdo1l2JyXvTPrQ2
X-Gm-Gg: AZFdTZfnSG/ksZ+UyhwGz5/WNazvBM2NpjZxTkaQN0E/09O9jx9CXRhqFgSO8R4R0PV
	FsJWdSg/0xnIXyUD3P8d/IHeRaDVy/rifVJrm1a7PGgIH9+EJwef/t/2VMIWhVIOc4LmfB6TYGI
	wS2+HCaQP+eanDFG37X/ywSVw8y8W9AHTFj6lacGHCOzyAMswHMnK2HCwNZNpusb2isUzMTa8zZ
	uC+4vr4hFFemnM4DSkh4jOoamSbwbYzEofMHLknkJa+9orIl3lrV9OaDEqb1rSIe+ngatFGaV3h
	HrfImB09NruBSvb/Q7Yt7yoFHf5ZXDyfRyT/Rx67PZaPT33qp181SVzUhj5P1cdpZvL3m2nR/yh
	o/C47ZARtsmlLyNAJUODaZuwqn4Ix6eJFoWJx+nCIP83KxjInnnEYxMe99+kFOwWolz7SIKoJjL
	L9YpamFM0RU0dpDjPMlQeS8G6ZTbywr4KPkgrJANv6dsDf3OnBh4E9zZo8YSEjA391i/O/11yD5
	T/BP9KANlyD/6KbyWElP5FA8dnRyG7b6b5FJshmk9W3irV9gMAslNEljMpN2yv3iqRV5FfpWsZr
	4UjRirnrzM8Cdsgx94YfxyyF9/0=
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr13865555a91.7.1795581446160;
        Tue, 24 Nov 2026 20:37:26 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm30506154a91.8.2026.11.24.20.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 3/8] phy: core: Make phy_put() ignore NULL and error pointers
Date: Wed, 25 Nov 2026 12:36:34 +0800
Message-ID: <20261125043639.249525-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL and error pointer check to the phy_put(), so it can ignore
any bad and empty pointer, this will simplify the release handler
of the bulk data API.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index efbd7e139dce..5004d28b167a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -780,6 +780,9 @@ EXPORT_SYMBOL_GPL(of_phy_put);
  */
 void phy_put(struct device *dev, struct phy *phy)
 {
+	if (IS_ERR_OR_NULL(phy))
+		return;
+
 	device_link_remove(dev, &phy->dev);
 	of_phy_put(phy);
 }
-- 
2.56.1

