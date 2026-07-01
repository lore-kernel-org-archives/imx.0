Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB541931D
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902239; cv=none; b=N4sanJ0uYFGBKFyHMWHNT1u6I89gNNmv+LGF0Jpx3WloXbcmnZ4voCmbg5xIACCt9DeMYTFp64G9P07RHapuQBskWF2zHXPkqWQ5yxJ8WwZcXrMdhYSuSomzwCvgUnXQ7gVbp636hY1ckuQroQKIEZpGEEZAtxzimVvCsLAP8WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902239; c=relaxed/simple;
	bh=HrnbgRNyzxFOIFM7kdM8h/tAHYI/D1p5ateca3yYyzU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=he50Qsqauo3v2lVFz68j3q0kBaECcCB6Db42QDQDxbEX37Hpxgqr/S5jfGkywduMi/XCyrp7K8q5twTYUUvgFX6ayo+UR+ZBnLpl2IPs6F0hGB2KgHZ4fQEl8hj35ceodT2l3kee8VlbFPPgmqnu3F2aK6CSEKeU6RE2I604Jz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=V9FyVO46; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="V9FyVO46"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-476d8e647e9so446280f8f.0
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782902236; x=1783507036; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia0QoIcPsX3jjdqrBe5j4cttXq40HPCXDLOJo63Nuzk=;
        b=V9FyVO46Cqc/lC2KvZbBgiudbEk/1uSdRynnE712chDadCeH/MBjHDpk2sxxC97rcl
         5lKtkM0+8EjojtKPXaQGofn2G5fdGPNQo6BYmnJprOxIR+f6uld0zg2SmJ87ZOxzrPky
         u6SLw/GyLEqAUvLybbuBjG15bpHW7JK63OWTJ4a2CHcPgAjTI6QbtGAo9bSZzyFZW1qt
         1wbqb9I/RO0DHkmlK6jv6OTDkoVkSi8Vf/ccLl1wxxGDMFZwbSxa/WwiEMGrBNVL1QAQ
         Sy08AaOHZYB7uW2dbcWsWk+wzg0vYnlV7J4u5WCtVD0IG8HpANpK7kl2CDR5wBsuZ2W9
         GiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902236; x=1783507036;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ia0QoIcPsX3jjdqrBe5j4cttXq40HPCXDLOJo63Nuzk=;
        b=SmBPvBrS+nf0seckS74/bHlYIMvPRIjCj2iTrliUS0Taf9KpmiXohfNLwrBlZQLidg
         2JmmauA/dqFyVX0qsubyvcPmMaJJpkNyyDU4VTwJOau4bfbbXruGc0Lrf5ig92h4D2oZ
         Tac6yH35lqRNZFfeK3uj2w9phzl1BHN2tCJUKc6Wi/BrxfbQJL73yw1sRmt79tV0QhRo
         kvGswGZ8+iaEb1YImBTZQLia57w4sVFSrN2tUztfntGJb+u1ZqeVPIx3f6JDPjXio/zX
         xlLejIFb176fv/6YBtG8YycRktL1gA0Aqw6w+5qYiRFsUpHLKiTna3oM8IPTdUWNMEXU
         Scwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr50GSqC1sJTSG5a3uwry5T5/SIJk1/1SXY81HLs25CHI9jID5GoNZzFbr9o9JEiwl0KT8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxB5/+yh3+p4xsfbe3px8GW+SnwE2PgkvFhCujh0DbciDPaNqvC
	wVVvIHTkUT/4V5axKt6+EI3N1/gQ9YjaXd1S+CRZ+IUB7ZKHnTzka1Cs5LQWVI2Bfa7vq9LKI6J
	pl/JJAJM=
X-Gm-Gg: AfdE7cnP1+Q4GBmFm6x0beW6Ea3sEc8kq/SGXbCW2HYUCyT3WIvPWUm+EF1QHv82LKW
	8k34c/Ytovm8xO/s05BZxPGBCELVHThPs7Oi6WNecfNzqnKixvon4gsFgfo0IyYQlu6Qb5wVy5P
	FNDtjduK2dlc+SxcbzqoLB1iSaQEkkE246vj43PdJ7we+ECXwWcWR2aqNb+JCWBFe0sCLXNP3xI
	3EuzmstZQT44McoFRWjsKTyivDr0P+liVLNP+vmBtJTc5rPjDet+v5vcDnRw8++CSglbaoAcz6J
	ht4ZcB99LhTH2BwP+NHSDkzYGH5pGIev1uok01+2wgQlqtURnawoHUbhZOk6xtnGMoKtFJhjFCP
	olJEocrJpibpLx8cP+QJB2B1ctt290KiaHw4PjTvEc5xPNeRQyn65d4X2A46tim26FecRWa50py
	DfXGCP59TODNQjmBdEfeC8bpDXUPADz6MhmV9wyGlMVsz9guxmeQ1h
X-Received: by 2002:a05:6000:46c3:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47759d1ace9mr1334239f8f.1.1782902236000;
        Wed, 01 Jul 2026 03:37:16 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm16809808f8f.21.2026.07.01.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length
 and retry Direct GET once
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Jorge Marques <jorge.marques@analog.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
Date: Wed, 01 Jul 2026 12:37:06 +0200
Message-Id: <178290222676.176638.8647414585139967730.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HrnbgRNyzxFOIFM7kdM8h/tAHYI/D1p5ateca3yYyzU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqRO3WXWXkpwZZzL3oCM2mfU1wuBHJmnN7dFTj/
 BMAtecl+z+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakTt1gAKCRArRkmdfjHU
 Rf6vD/sHG6AtPqTggR8ibu9c/YMNe+chL12sKo1GGngu15jwf9pqN3Yw1AXHQO2G30oyaUC/rb/
 YYJzfnCmHzzNBFW7YuJhFVl2W/AR5ARpLD+8LlL++4wGX0terWG7sKDnJr1GKVB6kZFyn4M7USw
 XATE3On9IUcfIUFxIX6jdiBNWF/sQxOTe9djcU7dexacuwixPjYT/fkrdExTV/vgJA8EC7HzyhR
 EhAJNnYt3/mwsjz6hVd8purK7xnFUnm7CBDwh6ybNkH1zEGEOUpNm8dN7MOFdORi9kPMrZinKiF
 J44pSi2s1yOOjoCizGaLEsv9FJ36KgbF/tNEGXitq4U3hPvdh4u2HLiKnPrvoYJ0Ajwdhmuz/Uf
 JuMOkNUB8K6XTTa/fVjP55FsNoVvPrDND0voKrIBsBddxj9GkgtnUQboNFEnSs/w2oGMmzgAufk
 cSvF8XmxQucFwmlIC9HsVSR7pYLrWoEbHtQ3fSU71HRNp+0zDUsYU8xSqKaZ5Q2Gc9VrHjWv7Hc
 7gBE40zmhZ0TrZerGFfCa/puvvamNZT9JqmWiuQVD9bOSYuSy+Z4gjxn+gDUsiLI8UfVGrQXimH
 nrMr37VJ1mzNSsc13zpKCZsrTiaO7LcqOyAO9iBHeCHgPFstQFzVQfFfunPA2s4O4Z0Cl4u1fSi
 V5cnWLF0XJob/Iw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 30 Jun 2026 06:20:27 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 6b8df8089a35..3ad8a232340e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -914,17 +916,55 @@ static void i3c_ccc_cmd_dest_cleanup(struct i3c_ccc_cmd_dest *dest)
> [ ... skip 44 lines ... ]
> +			continue;
> +
> +		min_len = p->len - p->optional_bytes;
> +		if (p->actual_len < min_len ||
> +		    (!p->optional_bytes && p->actual_len != p->len))
> +			return -EIO;

Unless I'm misreading, the second condition looks already covered by the
checks above: when optional_bytes == 0, min_len == len, so
`actual_len < min_len` rejects anything below len while the earlier
`actual_len > len` check rejects anything above, leaving only
actual_len == len. Could `(!p->optional_bytes && p->actual_len != p->len)`
be dropped to simplify? Not a correctness concern.

> @@ -1371,19 +1437,21 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  		 * while expecting shorter length from this CCC command.
>  		 */
>  		dest.payload.len -= 3;

Now that optional_bytes = 3 lets a 2-byte GETMXDS response pass
i3c_ccc_validate_payload_len() directly, this fallback only triggers
when the controller/device returns an error on the longer (5-byte)
request rather than a short read. Is that the intended remaining case? A
one-line note here would help; otherwise the fallback may now be
redundant.

-- 
Alexandre Mergnat <amergnat@baylibre.com>
