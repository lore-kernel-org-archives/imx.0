Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66753414A31
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522358; cv=none; b=ngJBr4VmrwBTIFQxSUzELg1LTuTaBnSF3/sMNyEj6YoJ/eRk1qJoegonKx4xApJZOQ1DACF3ovkmryV9XuSFH3Nerp2+3Xs2xKIQoaZZjexooDVB/wRzGHcQoTpc2Q058Dn+F6YpaeLmzETR6ZF7PekoPxtRheRI/b2XkWSBZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522358; c=relaxed/simple;
	bh=4CnOZL+iFIcbMNg4LvYJHj0DXJaNaYXRL4LHvyLzxr8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=f30DyQ/sfb01OJatatl0kt/88b6v5EZHz1tOh2j1lZ66rXHJXSCAGqTK3PSWRQrcB4rclnpwAaDy7WvssMrWuYyoh5owfv/SK9DLEtOWeO7NEeSnkDA9/caX5MJzjHkIDAcAuxPyJcUSNNXmPPHvr8A+uQcFb3ukTO/EqZAj7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i9/qoY2L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i9/qoY2L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c1950518so12521195e9.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783522354; x=1784127154; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+uyqxi4gyShbRBrMekCyTgM9cOpxEl85gHVXZJsiZ60=;
        b=i9/qoY2L+hihPMmjv8vH+GImfoZSwNBd4K6yzakQV+SkhrlXVFgYpzIWvwU2jc+5ad
         D6k4bIHKLWwHpXvlWERzys54Tmwcub0/NaItDbuWR0i0GaZSHGxhQd09MD+i1Sk+evn6
         O2TF+/Y/PFsaWeH1IGA1+OtopereDl9Tv0jgtQDOwlvx2Mt/yKmG3RSPmqvVZOK4+0Js
         /kRwhXmvsYQiJkTnjvSBMOdKWire6sAaq/w9kVWBb5CtmDm1gngcpKomLy3JYXdukNaJ
         BDHUXd3uP2ZTvJL2RV/7NGKhaaqZdZYhKAm6kcmbnCw3xJhRv8cuJ0G0rfHm0T2iIFkX
         MQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522354; x=1784127154;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uyqxi4gyShbRBrMekCyTgM9cOpxEl85gHVXZJsiZ60=;
        b=kB7VitYHDtE35DPbVsguWLblzj5JF84i7gDBRdiOYSbxtcFaAbxw8YIDNRttq4szBH
         GBVR9l3tyV0+LUcDezGwJ7q1vRV4iSvI9IEsajN1mcm8tc5OE+AzhacRNdtEd9PRwGvC
         Ab0M92oRfufwh62/55HSej3EG+pn7l2bt+ZYisvzI0bGZIT3oa91NUNCdgIwmj055pby
         3CS+QOQucC23UPUs0dOQitpE5MVnJGH/Rh3SSgYMTyojybd8ccROfNYwQFEyXjeS/rwa
         faqCSUTJVO9ZDRmmFIinBwyiNlRx8/9XzijAC7bZ2JllxnJX5idlsMJy8m+Wa1gvVpOA
         6G9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+wFqkgfaZlELBqKxfU4QCeJSgCTEpaSXY138yIyoXDEcwAWfdOkiL8Tw3zGeKHFPjtAk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7HR1ZhB78D2xEHrPLQpzT3lUZWFXpQlPlSlXTZtlLQ8Ps5TlU
	M5dCJ8AbevblFQ5PV3Aq6qTxT4JCo/7HLFL4cPgje4j0s1lahNDvhPEQ6+fH5mI1UFI=
X-Gm-Gg: AfdE7cnFClnYd8tmK+myTOtTOFaU+t7GWkkiusRiaVsqkqY74YczvYZvt0P9FtnA9+M
	RvpftzbBFu38AgsAvr/lCiw9h1MG9nciyp+nwd4bH8J7cwXJwYBu/M/jHlGkqbgplXzptPMIPzl
	J1vfvEe1yFtPV/JrqUnFE78swFuwDlrg4j+p9TD+yLeT8bzc0tTXEfSNa2Hyk52H2tuLsphN/fi
	BnNA6ADRiXbLwNZAR5LKXevTZLCvQwsFdUYnxkglJHUSTvyzupDonHe09Pl21Cg5KCLRCxmx5uv
	ACCV+CGIdPNgw0i4S7JUJmaMdC5JHC+IGXbvzoGmHmmirOcBmOtwXbFqiGzNboclj4xhvcY6fOw
	u09rplXzVNvy/uHBSjSmP6lO9W7/xr3q36oxkTNtUOsNxutTBfEK8/OT9UzAsaOvWeWSf+7VYFT
	Xb4Cl9ZF/RM4pP/I01Q9joceAeAV3vZDQ/L9jgAZhG+Tw+iQlo6JI3
X-Received: by 2002:a05:600c:1d04:b0:493:bc4a:a14d with SMTP id 5b1f17b1804b1-493e63a9f76mr29411555e9.19.1783522353790;
        Wed, 08 Jul 2026 07:52:33 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm147686695e9.12.2026.07.08.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/5] i3c: ccc: Add actual_len to struct
 i3c_ccc_cmd_payload
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
In-Reply-To: <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 16:52:26 +0200
Message-Id: <178352234642.1152337.5683615281919618767.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=372; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=4CnOZL+iFIcbMNg4LvYJHj0DXJaNaYXRL4LHvyLzxr8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqTmQtX50W1xQQOMzW1DMxXVQUGOe5W6mRdXYtp
 0nUPbrEmjiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak5kLQAKCRArRkmdfjHU
 RcagD/sEapgGNMXOHcySdHIXpZzv2lVWFyhjdWooE5GFNQ6QZnag3+6T+bKV+/UMMlyHWS5CVBk
 fPWtvFTvimSmLGufFA39BQsSzBFSpIcV854B+ONqq0LBooiLa348wqzcB64KQANOy2t9PJyVwgJ
 dqILtueqxDJACrWo6Nx/Rq8x7hbsqqY3NSn2O6R1LqbFJEi2DMSPYinEpyxdL0UrvxqoqPPkr0i
 cAMa7Td7mwP07hZLlSmaWAf7VMcX0j46ebPUV7GkQ/7rY61aKS3zBQhRowcEADIJ5EKak8EzZA5
 5Y5/Gov5k+tKPKe4I9/QzAw+Zz8kptf6AxGgjezxnTsEL4PGxG9rmxs0hLVYRev1Mk0hN6HajJl
 NwK/MJGbcOC0H/aqJO73hMvygmKkIjzfb7dPyfmpaOwHvouINiV6qUEE6lwqxS9PwmAANIxut3k
 Ke2TXRz9qxggO9Wy0iFj33i6c7LFmaAknTJ6yn9ruYZuMEpeXwvLi+QceGR0S7QMU5x5pbJ3SpB
 uQG0KCBCCNtJ8GTEeTIlF9rUPQ1pOVdymfeu1h5SvQP7XrqkpUNxbWamkXn1MPXcHPYi2g+rJ3M
 VsKP755IKvHHM3Yv3heekPO7cjr/QYt+gkFt++z0qaShpCOtdbxnFGOqvajN3yrLGlJX0zN69fY
 VSSrFz2odKPrviQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Wed, 08 Jul 2026 00:17:37 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Add actual_len to struct i3c_ccc_cmd_payload so drivers can report how
> many bytes were received on a GET CCC without overwriting the requested
> buffer length in len.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
