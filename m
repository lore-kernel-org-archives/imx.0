Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CF16C438
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713459034; cv=none; b=a/kWRXoBJyuW7vUdZRGSBDhP8+li2IPIARkYVMzCf62raC6hIj7nL6BywS+dHS3fPWblTYnd4XIDgQBV42NhGJEL99K28EAIpzMZOlbPWkOzeBOYOgaQmV0vZ7D3PpnvOGtPNDzgpidGHD/UdcBw36K9fAkPERqZi1kwGMyE1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713459034; c=relaxed/simple;
	bh=gA7kr3P8rammQuVG8J+GOuRW2Trrize3tToG0qF1s44=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nP5aO6KdlUsujVQyFM725TTCIiEfo0pXrXEcUnFx5eh6PRwNxtm8M6TG3M00AYtNanPlvNyjyettbadHe/5adD5p57kdNVMvEdSBAEgPjyj92H5bp7TOmD0Z2XQPLneeUaWpBwY6XWMN7fvfhpuZujhkUJG6TMPMYXlly6BQkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp1VseIM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp1VseIM"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3454fbdd88aso790740f8f.3
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713459031; x=1714063831; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gA7kr3P8rammQuVG8J+GOuRW2Trrize3tToG0qF1s44=;
        b=Cp1VseIMcDFB6zgMwDpWkQw9wq7YKfjglVUHfNW3Bh6dFbMwLqqIh4bYsyyHbUUSFn
         GKjiNccTt9offtFUPQewOXQxuamVBd8Y8KYfet0RYxVinLJw4pCN2cBWL8MCDx+xH0f+
         0gp4evHjMCDaADFeRzMRCoOH+s6zKlB1z3DROWCJ1vtV6EBz7KRIGAFvsj1sjIepPpzM
         polpJpA+kOT3lFJGYso/SrphpnaFLguLdUV/FuLmPUPangf/LaCNd/auCtDFYRiVkJmc
         5mhteKYY5WZvxstFJvg6QduZaxjbBIP7/XMsINKlrI//wnTBE5ojDvuQaDIyXpZtlVTg
         vWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713459031; x=1714063831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gA7kr3P8rammQuVG8J+GOuRW2Trrize3tToG0qF1s44=;
        b=LyTh17yDipLjJ80o3WOBXL4CfF9hdyH0uMTZUhjT7CssmFxNgZxLQnAzQ7lN45pyp8
         zvQnkyH4ri9fT4r4h8OrxU459qsdgemIRZkrgag4SEjxQpV2E4YJrCNx9Hd2jcATHDBM
         bYhZGgis+xvCeur1a20navkEAOyNI2znI3PVhswXXrK20AXtn6BZxbZKfMEHMCxE88tB
         4wn31tCC8b/Eg3y+T50jMAwWjlZMTjpq+VWOO2HqUzKyuZWz5GYmAHA3qxYj6BEXOVjz
         JeQ9yBYYjnpSHps9U/wUuapxbROVORIRMvS+v3O2YF3/+Sh8ZaQU0uOkWoKRDx5dCohn
         ALfg==
X-Forwarded-Encrypted: i=1; AJvYcCXoWTNegOejGbRzJQ9D2kDZ9osu8lU0m97EsZOU6y9IOpIpDB0CqMt1NeS7xye5eqE1jX2TJKgw7jYZg+6CqESyWcWw
X-Gm-Message-State: AOJu0YyHf3CKC0fdv0zB2tT46Za6nnAAHQmRMUuDb+iU4lP3UHWc0WX2
	zYzn2wyboCuyQfsaMo52ZmhdIDZY2RCCVZ8NGuxf5zIkk454OynM
X-Google-Smtp-Source: AGHT+IHMfj38JoZUDpClMWDwQ5C3bc7yi/tNoR0G8uDumFXmFP2ZjAKxHbWtJ3fy5o0rdm/ner2vrg==
X-Received: by 2002:a5d:4082:0:b0:346:305c:b0eb with SMTP id o2-20020a5d4082000000b00346305cb0ebmr2404081wrp.22.1713459030879;
        Thu, 18 Apr 2024 09:50:30 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e622:f700:cffe:40a8:31d4:2e61? ([2001:8a0:e622:f700:cffe:40a8:31d4:2e61])
        by smtp.gmail.com with ESMTPSA id cg3-20020a5d5cc3000000b00349bd105089sm2223076wrb.47.2024.04.18.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 09:50:30 -0700 (PDT)
Message-ID: <e6b42e27b3fd4a0970904224d7bd32c52159a788.camel@gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m-blk-ctrl: fix suspend/resume order
From: Vitor Soares <ivitro@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, Vitor Soares
 <vitor.soares@toradex.com>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, LKML
 <linux-kernel@vger.kernel.org>,  stable@vger.kernel.org
Date: Thu, 18 Apr 2024 17:50:29 +0100
In-Reply-To: <29e1a687-99f5-4e9f-a8c5-50154312cac4@web.de>
References: <20240418155151.355133-1-ivitro@gmail.com>
	 <29e1a687-99f5-4e9f-a8c5-50154312cac4@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

SGkgTWFya3VzLAoKCk9uIFRodSwgMjAyNC0wNC0xOCBhdCAxODoyNCArMDIwMCwgTWFya3VzIEVs
ZnJpbmcgd3JvdGU6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4oCmLCBhZGQgYSBkZXZpY2Ug
bGluayBiZXR3ZWVtCj4gPiBibGtfY3RybCBhbmQgZ2VucGQgcG93ZXJfZGV2LiDigKYKPiAKPiBJ
IGhvcGUgdGhhdCBhIHR5cG8gd2lsbCBiZSBhdm9pZGVkIGluIHRoaXMgY2hhbmdlIGRlc2NyaXB0
aW9uIGZvciB0aGUgZmluYWwgY29tbWl0Lgo+IAoKVGhhbmtzIGZvciB5b3UgZmVlZGJhY2suCkkg
d2lsbCBmaXggaXQgbmV4dCB2ZXJzaW9uLgoKQmVzdCByZWdhcmRzLApWaXRvciBTb2FyZXMKCj4g
UmVnYXJkcywKPiBNYXJrdXMKCg==

