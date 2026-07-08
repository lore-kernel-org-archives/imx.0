Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7083BFE4C
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522359; cv=none; b=P+4IUFiygmhyivSp5twEo+IUWYuLPZU3/pL40/Nr4GJVuMUQlsXTnPKKdCEYU3TALenVirH6l0yq30wDO3l6cCITaO8nQa5wup+yWhRioCeYHsWRJzsZNztK+oF9RPoKbIPmUIAsURB/tqXaV49wG+xRkNGjC+2ixQVP8/7Rq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522359; c=relaxed/simple;
	bh=6zw6s0CTUaTnsBUWyMIQn5jdniJ3Uw5VK2cUDuuWjfk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Gu6r9bfRTyLkmk0s0QpvbAJxyNgr/HR8uu/pI7/0cn+wCUuCQIft4LRZAk1S1piuhbbzOWP8b34zxyTz+IwX6Pj/qukrQ+Fy9eb2djhdOiOirNUX946g0k/wr9XvfY7gTROqJTk2JFIl/F9CR3V5/OLzZudReUK3xWGw7RLNr4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ksxp5PZw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ksxp5PZw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so5533615e9.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783522355; x=1784127155; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WtG/3aGhNl95hDYaYcCOha2vB+cS3A8UgbqMAykU0ZM=;
        b=ksxp5PZwCYP9fJqRGq7m7s9f9XPTtxmk7KzyW9IM2klzoX3gUWdR9KAmy+c41apexY
         BIXhInnA4+jnUstYWR4Y/D/u53jhWNNeKwkRT2GNJ17peKtP4icyvBgdfSVhmyT/qaP2
         KFa14n5atv043fftqeqMMVy86AusFKvd2F8mvJtjILkOwi6nanKAD/Tz1b22JQ/VVilC
         z9PqShUyg1s709jRGMSdUDxSwq2kOY26ol4VRbClog0h9D+mHQ8Rh4XRpX/BfDrSMN9E
         iAD8/NbQx3sAY9k3TVUBW4PsmcrZXoeg8U1HMGX9dRr8S90lmFvDDsmP2cIyOP2VDVB2
         WhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522355; x=1784127155;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtG/3aGhNl95hDYaYcCOha2vB+cS3A8UgbqMAykU0ZM=;
        b=IUbk6CofkK3in4ThdebbVckN29HIgrmG+2pdxNpMSl2K16MzobM+DOxSOXY82VUjof
         FQagqi14i4Xqawgv0kPztlD8MntZR2g9RIJFm9/uvgiqtd0EhhBxx3zfK4aq9E92izsu
         Jv9p1ISiUmf5JAn4gWr0aT18abntNMzwQLsq2AzOiY+9EKRnhQFR8PrByPJSiLrGRMfE
         vN4QT83mrELd8jO1O18cMArbJlFXct1nxt5tTS02cFFoH2o7DS8ddkzqosR6+oBjTYwg
         K8uvt76wElw5D0QgITnCBvWEtqtIUhBn6jo0U932udWgzcVDVVeGx1ohdMIdpPU3RCYd
         /JDw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7CKflQ11fTPcnUH6Rwnp9mU0N9dKQ5wU1r5imKaCgUOHuN8jwOEJkGtGrHevi5evvDnM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYQgj6kr4mu+xDcIKw+tMqr2pU6cdD34FG4IzxoL/Gb0BiYN6T
	R9JhlDTKM18psNhu1wo/bSkXaKz0bnyuxCG8qpvwWyE1a9P1fh/qPIuHQHOvmt2kwi4=
X-Gm-Gg: AfdE7cllqZe8kQb2ixoB/eo6+7+vLx/BmOHsDzsPQI4Nr0TQPyJr891/QoyRMrleLM4
	Wq5fGCWS5krVQWL0764rjX9ZmoyuAvvWvkn9fgpz7V46Xs62Gkw5nAuMMYli05OReK3LVe0UiZe
	kVSp7WGXtUaDQ2yAqJZxUswmI55I4mWV4gvMBZgjxpNxIVVKfdUvPs0Nw2pqJh9pIRi4vL1xjSH
	+/IFXPkpr22W6+/KXpDs/48oQqi8/0EYjkjv+nIzMM+1SadSaSp1k8FcNm5NSKN2WS6vXx2E1wJ
	Y7jTk9i4EjE0IDQhDqaAX+mfx8MC0m0nv4Zzx0DMqj7Hz+TaOjBQ0m5DtLwkA3N9HL4osOoywgs
	S3HzxlqjFT2QglblhL4W6pGrVAwf4xt0U+8VtSGTls+BM+gzVgTvVXfg3Ll0VUj8fJbuKyrLmiR
	NA88AnyWELdTUcUY6pIIqtFLjRDy24y+4L9HfdGcILKpxqGZMCorKY
X-Received: by 2002:a05:600d:8496:10b0:493:ad1b:b38d with SMTP id 5b1f17b1804b1-493e68ef1bcmr22810655e9.37.1783522355279;
        Wed, 08 Jul 2026 07:52:35 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm147686695e9.12.2026.07.08.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 2/5] i3c: master: Report actual GET CCC payload
 length on success
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
In-Reply-To: <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 16:52:26 +0200
Message-Id: <178352234642.1152337.590208523920132503.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=454; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=6zw6s0CTUaTnsBUWyMIQn5jdniJ3Uw5VK2cUDuuWjfk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqTmQuTCnP8OXYLKhboPk6Bl8nbFgpA/6RLfuKS
 tt5ICq2sy6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak5kLgAKCRArRkmdfjHU
 RT1DD/9snuCIVJwmkX0+pQPjtzsR+oWk69wMjJFQo0woOwVq97mTPmBA7toL30HCe8eGpBJZUFd
 wOPEKLsqdjD1KK6DeyUMAPPXqgsQSh5NEUy402ECdc8meshXzUxxu/KQg1vxqgVWdXS88lc9aCx
 O4zKMkldNrJfgTHYaDtZ7XAY4LKy/6/22qJPUYwLWIjWrIuuvg74Wfu/1Obc8r+QPU0ScAGGTeS
 h74ETP2VELs7uxm4tcp/Da7nWuG0J+wJmG5HWiwJEF3AgModpFWXUx6+3Zq4UBlY9uXDycaJ7ZA
 lLL2wVPAggIxHhwYUh+gfKUatmovTu7IlC849OFwh30Gz6k7OHGehUmvqqK9/ScjOaQON2QwbEa
 WA7lUF6h29nUYyDGNitDqxP06Xetm5cInKalya1vFTCY6JcXv8kEuo0vBb7S6hefEJhMM6smtYJ
 GfSuZu2QlWJ3cGUTkZgRkWm8C07zf+vPhvQ7VIQ6ipfK5E4qFZ6fygWvCV+3Ph+wywh7nBpW+ex
 eZRgQ0Aem4tAUC25+9TRVrMl4B68/BZnTHpSDhk1qAf3H8whGYyWptWB+AKFXtWlzK4Qmtxh8Ax
 Y8wZVy3Tc+ADJ37vaar07z8KQ34wEHSD+PNv3UX3FTOvYu6An9D+48bhrA5b8HOYqcIwBgCMpqx
 hxVWbKSM7uW88IQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Wed, 08 Jul 2026 00:17:38 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Set dests[].payload.actual_len on successful GET CCC transfers in I3C
> master drivers so the core can distinguish requested and received
> buffer lengths. Switch core GET helpers to use actual_len instead of
> len when interpreting GET CCC results.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
