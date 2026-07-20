Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1882D6401
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560530; cv=pass; b=REOvSJyguTA9zHCAkYjptiC12Bm+h40goWx64p3lPP1DpcDkLmxNbkHEr06JVL2Zosh0FXjRA+OF+fjlsKpVhKCKw2Mmjr52beGchM/eN7/d7J/AwPt43B5FrunCU+rt3fXvfdKx+V8a6/dkkBLafW4VyofOpgyHmwh64rOT4r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560530; c=relaxed/simple;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+cF+Pxux/mzlrTu3EDEws1M8dopwGd8bR58Cy4VphtVTEDp/N2udVgJ3y/KNqJO24RSwylH/BAb7qdWXWTy8ywZ7W5jB/7HunwozD/ryjBfweqczJemmFdHxmay4D2pXqLzgFqwHdTv2qxgBwU9ujcEStD5bvUDx6f9KFEreY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diWsUKkg; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diWsUKkg"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451fd21113cso3047126fac.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=gmnItalHfLnmePXyqJANKo9Wbxcr1hilWd/NPLbjW26GcTGkiYbL5HSUamncplQ2a7
         B8TDYJsPWEKw5ru6+qYFH2sfddkS7Xt8Xp2pOUwqTphQtKsGYkyt74oc4BLpebZmkjvt
         HXsAqftXQFfW+2ADAlKWqVrjUELAMQghDwrIUPAfR+mGRLhhh4185HalDsYnzN0AL11a
         tS38+C+dweu7aLD8eZXgtQGxQy8/d/waTmuT31gaWGbjalEdSauJX+GMc+0wiyJ4NUXp
         sS5nvb56KdM875wQK0tvQxjlzqL9fgbPJ6ZCrPtlg8R4HCQO3uXBog17qKnl73wGisP/
         YXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=wiCx5Wvia96juQfr9mbk1ILtKQZ6Ac5mq+0vNSffhBg=;
        b=CaUQg/ThgZ2JRE/u03BOGA5JNgqVEB21mozLQVLTIW7oVUuxOJZq5Cf0uXSRnHWHoz
         N4vTHxi+sOyUE4v7MxO3YEDtrk2q0B01Mu4bGUhH52zTriU8Xpfa3QQ51BbFIlirCOpn
         0P8u6E62v9Y8F2hg5FqoZ0qBTYOMS7adqsXGPTcMFt7XP/E0dBexF0PsQF+nyVVkvxo4
         EnER/6xd3o8DJoWg+HZPzbJ6a1TDn+1u46RnZL1WAuaWV/lE62Kaa+B3fNycCZI3PZfd
         gkpx/3sYNqyELCjr1sc/6NTwCCmG2klWkCYGeC92KWknqkz7EpKW66V27PQgK4JVhLq0
         BNTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=diWsUKkgp50drBPSLhl8+vTiUz9rIa32Urjr7TT8fymBoG4wHQohE/k5Hgeye4xgTt
         rWIJY3/ylqqKIwDaK0SOANcGmxQALF/VRRj6wZxh/UnGfR9ABKLMBQHKNvilCfK9lELp
         iFPV63T3Rj/afIRKfGophmum6K9jwbnSxNvM43zNUBTRcrS079gYE72Weu0CFugoDUNA
         biVCPKXNItIpBv+iiE2++yUxdUhamEotAsyV7HmyMKoQ+PGkLOpxVCq9YNFuN4QJtRX1
         sd2BV0d9y2/OGwSVEX5b4ydvDMEWDdPPesQNELJp82FLJ0LOfrosuWB0bwA6HHaeubvu
         UGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=LhLPfQxrJNH8ZdR6/7pyodqrmeP4GkBB2Box7X3Igj4/d3yv92BT/ZXQhrCfhOS8W6
         KhQx8tsmn0DSVnCtFsyco38vbndPLZ0V526HfCuSqJyiVV5MsXgfH0Lj2TbsHwqYdSCM
         ckrLJTwPQrQ8Rm8EdYJtLyJAbJfHiEJMWz+I6ezDluR7QiKkW/4E2o3amRCFZ0phLwce
         5knCwolgOdodNqPVPA7xZkgOyAQ/WNDs/2xTEAaapXaov9ePIbupx4pGrEkwVGdoTtbx
         PE6OEeU+Y1Ma5MaSb3qdilbSFbWiTrsC6weDGtuRzM15kT7VsrCID9j3IWDSfxj9wfkf
         uBgw==
X-Forwarded-Encrypted: i=1; AHgh+Rrcy8MMHX4tPaWAKRhCdDMl87c0zKY8SvsCejbAdCvvseTlHwjKXdkIpbTnUF7/xribK/s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf0+OSqZh1QBYZSReVny4GOwzJpcPUJgE4mZ115BL8sU71BqSh
	gQ2QNabx9tB5dGZQweHaMYI/I6Dcpq3yn84g/lYatpPwn4BK23nhiwpqFNiJr+ht6F+y2Jn7JsM
	IAFpRVVHmCuf5BZwW4HuPZOyXfHdAlk0=
X-Gm-Gg: AfdE7ckcU9s/cbuLE/4N34Zd+QyavgEsp7J5AXcWyQlmAhlRvPjqk1NFpLkzVs5rl/O
	CiDYS0nhPhjVXKb04WAfOorkTvuHJv60ne9N6rHBNaR47KUqDHcMzDoiNW4XeIO7WiDNBC5xZBB
	KPhdGryBw3V3y+yUzb8t98F38MfEEx7UfiHpeRHMb4XJXrtRo12kKfNvBT3CdhRaU3IgD6sn9oZ
	um0G25uS56SAGMt8lRAFvXIm15KZCVE1zuOdL2Vq0wBmsG5yVXiOgGQkF8BVDyqg5TIwrF8sbOL
	X8Kk28ftLZgR3r3rcRAfqQG2Y6w=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo
