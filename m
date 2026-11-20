Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173105;
	b=VDwjmV/n4BmrzG38U9LURHDPaosNJzyRH95qI2aX6Atw2gSiJDa+xDSnAUsyITJ/cLGS
	 IDKfdosLNJSmPY8eKxq8w2ZMbZC7oKM5XgYy2BsucAnS+AbY9hpgGCeHXea1N3g7D0bi9
	 PgDEUuZTAkoA5adpKkGs6aBOdtC9JoBdaX1IaM/gNZjL3U4Gw0u+ZfQXM8fN5HIE7hZ/Z
	 7XtRNutNrlwEc6gRVP0brS+c5qUx9IRQMA+Wn+FRyer5bBpp/UOQcwQQwLMTyRVzaVcKN
	 2mVb0fS3BNvOgKcHOR2wA4ZQDgaCV3Crp8Odcaek4m80njtiXehGGs1SINe+fmbu07w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
	b=kkAXTeqrw38x9jIeqcIr/oQaKkUj7p+h7BvHiO+diB1lLHPV4EP6d7HgOKA6rN247YEh
	 hQk4BV5n00WRCSRG94uh+Kjx1+59y98OXDgj8IkraUdJBwoi4olJ43PIy2RwzxzVjL5Ns
	 Bqjo10roUO9K/Rz+l+QiwOPY+hCSodzYag2fbsaQnAGBkO5MFfWlQO3CBkcKjxRIX9uQs
	 YKdhzGdDgxSRoDpbvj2wpdJGQtwJMyelMVChENDVYBhRHcyd/x6KlhiFMjoWCvMAB6G51
	 6A3IQihIGCfpOR9ELkDm5/QtDBPDWVBX6Y2PlT30S0l1NyM4PiMewH0QLoVhAY9MYAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W0poQmQy;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573960A5BEA
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 11:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B573960A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W0poQmQy
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso131840566b.2
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173103; x=1795777903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
        b=W0poQmQy2bn7UPh0RcvSoxuuo1hgV+rvi4pa474rH98AsDUTsyGyUbaa3hCcfcUIpP
         xNmSKiH1TN/K1uQzjCW6zyWkF984ociInpfxDO1ciu1VAxJB//CzDk68rrVtn/3bHQ2b
         cvMVDyrmMlGGo00l41NsxKAgAwMznnouyE5r6ZwTS2XdJHLzvs5IsMObSY9P+PWskI7L
         C13pFnDhVlXGCPvBi3FEVqyZ32W3JcfJFSbNTtndDxklBx2yaS5ejajXx2ePYjcSEF7E
         50xLh401yjjYUUmx9SSO8QFAMkiUOOp0NcgmtLWBydTy815+/yO305ollRIoI9lgy6u2
         I9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173103; x=1795777903;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
        b=HJK1sSNwYKtcz5+zqZEofSg08ih2cW4hWooB95lmE/cIPuELE170FfABM2ClPuq3bQ
         b+FN40+xflw8ApKvVrA0hUCamAc0BirSH+/MuzI4+BbWkCZaiZ8Ayopj1YiiemtyP6r6
         MhLr2NeDw5Afjph+7DDudAYvJThzFZ7p/mz5gu0ldQBYYYWp91FzAHEGNP0VT/3f6qjQ
         hACTuKHqMuVcziRGgwLz7aUXubtZARL0DOy8JkHWJSY2MKnEtPfkGBvLb21ZcGxyrcVV
         z5x4cannTxe7sfLsMkqp8i4evU4tcjH7twfYwMWTB1gluqdPReY3bE7+Yo7D7AZnfb5s
         BXiA==
X-Forwarded-Encrypted: i=1; AL+hErFKSkFEBXBJn7+pIoxnHkHVMc9VEzEtUZSkwNIDpsDrX/wUtvAKHHrIKJYaV9ftwAFhMCI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+tZ2eqJpvwIlK41EGpBH5D1KjU3/kp9e/c//u4Vh+4r77pzDNa
	QT2ZZOmhA5ZR3m60Y7GANeQ+UZbGq5O+VFz3gK1ze7cWon3hLYQEgKkKv8dCWN5oUNk=
X-Gm-Gg: AYBFou1tpeKV/G0AbvxAUjk6c2p4slbbLpvDXKO33D0B7m0SSrn4rTh8ABb8tZwq10U
	GiOkpdh5AqUblWaTHkV3HWAc8LsQ706VWEL2pQJkfOZqI9omSU2z+7NDWvN5uhgXvJ6ZjCPSlkU
	L0AmVBx0WBTrezfz+vYm1GzUQFYm9KkY+uUipshYYyN1pCkpdL6Y+sAuQyyBMdo54DFnrImO8l3
	2CpgxJKO7I3q9jdu6b4FncQNU3IZNS+hw9OmENhe1BKjANT5/I0GEOrtrGHAzrZUj3a+y35W9Ch
	KHT3udiIQm+3e62n/03MJyJpjrc8YSJ1Z/jNdPA9nmt23XmexLTNL46HbS7xBvwjJzXG/q+bo5Z
	/TpqctW6Sl25yOe+LuQ1a3PJfF4deJDVwYj6MMu67sRRiXrPKAP1pXVi5pxXDNbQqVXN0CNeooU
	uaxQ+iZdTSXZMs6WZKuNfuijs0+G6oFt0eHGsA8EGpVoJL7QBvV+f3ML2RIbmDTzS/zB2EO7zVi
	BNVWkOQxupTA7nIROadOO9fMY1qZ9vtDj1W8kbytDo6OPu8HDl10pNHBpUBb72npwnvPGSO4hlJ
	pXNXMoOc08mFHd2W1rQ3Wj1lFYGJbHBytil6yphmRfQGIEjRcndDu4sH/FWrF0jkLEEB1IAVOpz
	zuw0NAVHwsrxEhIlZP6epAogsMnwrSh7xnjwVfg==
X-Received: by 2002:a17:907:6ea9:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c513a3a656cmr295368666b.5.1795173103212;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61ddsm4595920f8f.12.2026.11.20.03.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:42 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/10] clk: imx: scu: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:08 +0100
Message-ID:  <ddc76beb6482214e115d8ab205056456924c5db3.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=jgaYqFkp6U+MJCxcDBbdbssya7kT8plptxESbnjDSnY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrYXpZia37r5qPKPkOrurPKrb8qglkFq6zaI hJ6qIxGohCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq2AAKCRCPgPtYfRL+ TkoCCACdj0BNZECS1Bkcr2YYSsgLgLNmeGbEzHiUikzoyjSPUo+CaGzWVCCIET0XINWo9+3waXU PSQpRPKpDtKhIld4oJWXugSRyfxjuz1E43RBa7QiYEYbyNy9LlMIsBccnnHXDPn71inefjcuwEA W4ud3FTp9OkvqEDwnW9c7nB4ghuyBDxk22UkGM0l+4qOyp9Z8WHOmFkO5hMt6GkyBnzfNzuTDZC 72tn4Kbk7FcuJMIEKaVxAuGdCpUaCAOhQ/1aRAYdp0fM3IOXQEspsJ24o/Wyg3SPgSM0I9Ek4lP CI0G3MZ6IYzhgWq5ed0ZyQb7gf3EgesBp/kPF5U4A+pSFKw/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver makes use of device_set_driver_override and so should be
allowed to match via that driver_override. Note that the .probe()
function assumes that platform_data is set for the device to bind, so it
can very likely allow root to oops the kernel. This is not a regression
however.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/imx/clk-scu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 0d034e206c6b..7622890d1124 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -626,6 +626,7 @@ static struct platform_driver imx_clk_scu_driver = {
 		.name = "imx-scu-clk",
 		.suppress_bind_attrs = true,
 		.pm = &imx_clk_scu_pm_ops,
+		.support_driver_override = true,
 	},
 	.probe = imx_clk_scu_probe,
 };
-- 
2.56.0.rc1

