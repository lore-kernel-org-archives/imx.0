Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986037FF43
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524010; cv=none; b=glts/C8xMX3CNZoGpZ27BsCP2k4DVZc0vGy14EqnV1FU3o6GPpRy6DKw4Ka8M6htbXkp2rMtp8AT37NDMtbrFI8j/VcBvXGjCULMxtuRynNE/ImL3vokCkra+3yV3oZDPp+kKjxgID6NW0JmYZ9RuMPaaMLvRs7Mh5dpThXoKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524010; c=relaxed/simple;
	bh=BBen1slmhyf3fNvsg7q5c4rkJsBFClN8c8AiUxc7BWQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Ow+PBAPjm3NiVae3cwTjIfbOB/DNofdkowWNnxeW3go9yLLcaLClaMvbTfdTUOMee1VhWd47sVLoo04/iQEminYSc8CiqF2Jbg3heD/AMBIQpOb9Z8bGDiZcBTaa/EsPcXXmkRTePDGXZNZ5qBz0y9XzPj5u3P2T5jrvqbIx8io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YuyMTsta; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YuyMTsta"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5672955e9.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783524006; x=1784128806; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CHzrrzSnVqIsHsO09qrkEkxGis4AbbzO3jB0Pw7dZJs=;
        b=YuyMTstakGd1hoJdsVgDWoWzD/fkUMya9ZlG7QP9q414kQA0MsXymIhuKGf2/ebEMN
         21CtBEzi3CqZMxdfNliZGRH0WnfKys1sgmB54w4mGKQvACC/qOzkrA8ll4VYNlTYXU4M
         5ZG55vjJQyrHiNYZg98TeFUyp4Rs1TW0Qkm0/72xHzUSI9ABEBTl3jhMQO+NegC6CKRh
         JM5aK+uAwA0Ag+kGRJfkNDN/L88biXazZUKFoUAldjsdVuKs0dpUgkyxjQQID7o836/e
         zwUwaeJ+7+SnEYxlAlUkR61nWQIVvSQQ2847oTEAZCwFBP7ZF2oWuZj8wtXoo/nJK25I
         9lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524006; x=1784128806;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHzrrzSnVqIsHsO09qrkEkxGis4AbbzO3jB0Pw7dZJs=;
        b=TppmC8Phv1JMMpJfgvtOsKfVEn/VNvgE3EAhBC5LZlne3ugT3i6ihb+kgssAS9o2wk
         bRljUrU1VNtu3NqvvJC1QHW7lzATvIdIjA4Vt4jtmydbJBayNWfbAkSAoBhiZPGvpMvX
         Ps4W+YX4sALPeuJoz6J/F8sCm3YxOPcmCHWjCvPnzxwSzceW4FsLJlw5DzLuDj/enXIv
         XYZF+3dPZxVk97bEscmRT0pOKHBIdyMWyCbrcR810fT/MWU3/cv0Mz7xpznLnNCq/Hiu
         9h8yL+P/U9Z2DvSCnrNW2nWgaPwhdrU/K2BUao5wg89Kxu7qwz0HXwaYriGXfhcRCk3p
         ILfg==
X-Forwarded-Encrypted: i=1; AHgh+RqOq/wB2wIzzTq5e42dW3UGOSQhp7iF77idDteLWDqQ2H/bkDdXaqQYzpmxpUpyv0fAFWY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Oj/ZfTYDvamU+hVDW/wZ1AzHpDNNPKa/u4GJbvJ5MLedge+q
	xE6tmEwKWzUb4vovre1L1YrogoQFsSGzjT6RgXpXyYoES8vSARAy3nmCFSTKuzGd7n8=
X-Gm-Gg: AfdE7ckaGQU4qGnHwfr4ws8ZnuIqPoFmE0r/onrv/ZB3+fMnVdSgtSZ7Yse6w74vPp0
	gl+nhiTwGgmQSQT1yVBzRWE/C6GgargaypMMrjeWIpjHS958cc70TE9RwijlD4AAMx74C3kZ1c9
	1Uu3HgZ+KjYXk/9M0Qu9xJ7KHlRQxeE7B2rWFGWGF+Y7HtVw+IyUDUPDr2XxuzWSLSB6vnSRirR
	MBoXk/cY+0IccH3nw8X8v4ySYIE05Wf89v6XZfWSz1NRURxOpFfGbdEmFhUNZk8szzId596J/zD
	+WKfGPgwwljy+TNlYivg2tLUYKocXEcetbsu736yEArvglZujgufqCZ2y2rM5gIGqcV2cAVX2k+
	3/u1QLweyRb1U19U90hRx0zsCjRItDabydjR5WdC5PvNtZYWOR+jqK+h7BQQ9m6+0TpRIc5jHaB
	6pux4kIXR26VQovS7IsjrJdxlc6Gn+E0IHDP+9ox9GWMGaTo32780q
X-Received: by 2002:a05:600c:34ce:b0:492:4911:8a with SMTP id 5b1f17b1804b1-493e68bfa4emr32295945e9.12.1783524006307;
        Wed, 08 Jul 2026 08:20:06 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm152501015e9.5.2026.07.08.08.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length
 and retry Direct GET once
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jorge Marques <jorge.marques@analog.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 17:19:44 +0200
Message-Id: <178352398481.1152337.5612091417598122410.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=BBen1slmhyf3fNvsg7q5c4rkJsBFClN8c8AiUxc7BWQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqTmqiTQ1rYO8GDztzO+9B2umFemmkdZs7MFhoy
 ESfmnQstfWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak5qogAKCRArRkmdfjHU
 RcNUEACNWK8pbRiPjKANkZ4jeEENSyt0IX6HsnAyxQv4ppMPyrZ1dYD8MITnulU19VAsQJhV5Hi
 ojameuWr4iIb2TXJ5ikFi9IH556sBOK36r8tEahFHG+YJe630/ByNMlXh5lZ7d3YEYCEtqPE+dT
 5zrqNNRH4VakQGxf5maivJpeoToQA4/Dz9z82qX43C6ZmyWzpOADASeoh9Luzb6dZFnqb9YwmjF
 XtSsv823lxvlZZdSb2JvMG020i5FpgkvIXtoNngFisjRgQfBWFmYZrYID2a5PVSV2QD1HLwHUPR
 aKrE8Ro75R7qEpx3eP/xMWsloFBxuLwuigzWAHiXxr6lyEUgZ1uwum8nJP0SfkUPj5rAJXoXY88
 mYl6x6DjfN3ZiLbp9S8m6bTes46lXAHoPiTvoGxpgwMNFmLTsbVsrnlHFGi7+Q+l2CJepeabOOO
 vfKEXk4WjeTrT0pjYL+3Zs8B9F1HxLm3g1WrxqPpH2uXDkB8XTEkdzR/L9WblVHrQZH+ygxG211
 PkKLeh8EGRDahSsRUDcDjXxt0miVGQr+aimm+p0xsGSaeQbayYTvmkuCBWecuD4ObTQOYlTmJ6z
 InagyA7bafmaV0AnRUXgZu46snw+rxIs6E1tI+MI2kwmQwqLr4dHFL7/NAhCvFJRWiIso8nNDUI
 CJdyvB768fIMaYw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Wed, 08 Jul 2026 00:17:40 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Add retries to struct i3c_ccc_cmd. Validate GET payload length in
> i3c_master_send_ccc_cmd_locked() after a successful transfer.
> 
> Retry failed Direct GET CCCs up to cmd->retries times when the driver
> reports failure or an I3C error; validation failures are not retried.
> SET CCCs are not retried by default.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
