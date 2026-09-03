Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67494499B0
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424726; cv=none; b=WlRXrPjFgg2kWr2o8Esdib049lsjxePGU/EAOjnfopVa2WlklaepY0eG8aOhm/y+4xyzYM7ltUwEbOG2AAWdP/GQ20A/CUUS+DYq+vtGsQso6biDPlgArBzj3kqusYIPayI5+XEcsOsfhZE9z/Z7DxpuRM32cQujCNvO1rK30XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424726; c=relaxed/simple;
	bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usp1eiz6W/G6w9dbOAhQMwLzSlmXAd6BbKBuarvpFvw8lpUPCh5B9uhxI+NzKwxb9zYz6D3aU04d5QZRF6FyN5SctHa24E3Imh21Hixs7qMfn2SO2oQT+T4/F2Xd0zh2PWOCXSjgPCBTCeSrUR5IxLA2B6KsvX4evtPB2ptjVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFb940hf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFb940hf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1342403f8f.2
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424723; x=1789029523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=hFb940hfv6OIZ+1XGzH284u/ts7lMGsLzknYdEfoOjxft0RGFQk9VL1UQjYSnZeujK
         EP+fS6Ry0uIjHg58FbBsNZulorYwJgQv2nJ1cRP/RitTjBv48lKrzsF3vRZS8+U2rUBy
         1KWJOu6TTbxzdIpOWmQRguJ2wuDKNi+nTwT9I7F/XcgaHPvsNmNBtCkCl3kqmQTMCxZK
         GLD2JnIl/lv2tY9qNoVGQFol8O0kYNyCtdtjIaqMzO/E9GZXB3ZmaZ/3TdblQ6Ajpv3U
         P1K52ih6paSg02IVax1FZqHGltoeFJTK+1O0W2yHdcf4bkTjJe4wxEPCBeasEgr+fiIe
         HNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424723; x=1789029523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=jUCUbXYkpcLyDlxUBMhPQnwZqBenm76lvayPV8lCQgaQqbaL+MP94Ur+nl5Z1jqq8o
         Yntd7VnT1JNCd4YGIqZkxTm6ck1uwuULCBahVLs4KkMwWA6ahJeWwNdVnsUc/dii0Kr0
         Y1/l+Oyvecj8i3y/S05W87S49PyvDXRqEd4A4AlzoOVn7UoEHWR3AoK41I95rkGVj17z
         vXLASRC9vNxx/Hiqprno+8IVMOIiEcPE4d/AduUfnxbp6M6YLciCfMXZ0bAaDyi9m7/M
         gWqH9gxfYpWT36b6D+CCg2rPGeeSXRZweFjcqFzcMbOjOUDrR5Zigs3/8zbK3lS0K0Lm
         ZiPw==
X-Forwarded-Encrypted: i=1; AKwUvByij41SMTSNuBSoUuuvthAIqsa/9r6cUZjrBpwZ5AXp6ncLY6YrqPicRZpK2G+ZDRjJP4w=@lists.linux.dev
X-Gm-Message-State: AFuF++lZknqwihxsE3UaahWooI53M6xDZeIjhanub49vQiHDMtQez4U6
	AR9EzFhVLd2rYwa6wnUo0abgWhSZPI36b/LAESNRyhuLJ7UGzHgncrBI
X-Gm-Gg: AYBFou2HW+o0nQA5XDKa7jnuxUHN+eYnBUL22N9Eh3kGyTl0QR4Y1znFxC1YjldpwKf
	3SIncK+t0S97UZTo5P5YvO55VIer8esZjF5lvGStQ4Dtq+reOaN9PakyqXLz30aNVdGK8+5DSe+
	evO8oWOPOVUJTRjJ8C0/ubBkShOMUFXpGoNaUHCb/OxVn4XZdqSjeKiKB8UQxOsUamDBOZSHJsm
	uf5I02A1J4T5nEcNw4YSFUKzuB6vB2gOysVIgtqD0nyWs/hYQTfbWpxqnoOHKIhCs9B1lYTqycq
	/FzkcZQSY2aQztzyE5yDeErpTLyMMeKkWSTlhAccXJLlfy5vTFbqYToMUn5z27ftykfvqMpEc6g
	Yrtycs6zcngaRhOlzuTZa3tgg87XF6UhjjcpbKfuREEDIsraam9RTjO8dg+oH3Q5RxgQvxEh5XL
	1ay20cVMqVeUbpRtHW9Ln47SYKARurmmYWYWmLqWCR7I3B/zWTWk5NHN8b5VkXTD4fC6cOejIL+
	hQK
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr17932547f8f.8.1788424723044;
        Thu, 03 Sep 2026 01:38:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13075059f8f.32.2026.09.03.01.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:38:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 10:38:41 +0200
Message-ID: <20260903083841.2114833-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> Why are you spamming the list with multiple versions per day? You're sending
> a v5 as I'm looking at v4 and I really don't like to have my time wasted like
> this. Please limit yourself to one iteration a week unless you get a set of
> comments in which case try to stay at two iterations a week at most.

Sorry, that was wrong of me. v5 is v4 with only the get_config()
documentation corrected (it said the answer comes back packed, it is the
bare argument), no code change, so please review v5 and ignore v4. No
further version from me until you and Linus have had your say, and I
will keep to one iteration a week from now on.

Mehmet
