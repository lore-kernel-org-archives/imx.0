Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4342641B
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377843; cv=none; b=qV9cCIlv/E0HVFch1VfvvamYuK2ouHBmx431QUq1zv7JWmgn0QTdnkVpt6ZG1PQUMvS7rIeu/geCjVcj2VaUyGKU1J/yGHc0o5yylizSFhwxsw5TqbOUOa6947tAaceBd9wEm09o7x/audTeuiz1v/5bJRuYXhsJzzfZHOzy4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377843; c=relaxed/simple;
	bh=PJCpttXgaFTAAuIppNV/gcSz4Kqn62rNZomfMgasjmI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GaOIeNNcijM7zjf6l5h5n4ttJIRaIbqoVIkiFuIhOJ7vOh5gcXhzOrr1Ax41T98yq06QGh8LHIUlKVI5g1899sfqVGRNSOBmA+q+iloOyxGN1OzabLF0d36RYlpi2WHbVIRWmO/XAZpIyyFKNv77/Ni9sNwLJ8dlvKigXD7Bz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S03B2mRD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S03B2mRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789377837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
	b=S03B2mRDhMOL9hadIcjxq84aJy8x2b9D+LQRphsfR0PdxlSCwtWsvengupFKEESvc1Vm48
	I8ruJN69aaAnU2kVZpNcR43EyW1fQVn3HoCQ5L+YIzEkzrMhFUfviLS2Oe8+EcUgt3hZ3G
	77M7sQNZfEwjFDdRQNiorKBilPwieko=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-iaRFVCSQPYylag8iEtcpCg-1; Mon, 14 Sep 2026 05:23:56 -0400
X-MC-Unique: iaRFVCSQPYylag8iEtcpCg-1
X-Mimecast-MFC-AGG-ID: iaRFVCSQPYylag8iEtcpCg_1789377835
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4955e865174so14964135e9.3
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 02:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377835; x=1789982635;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
        b=A1OMr+azo7M/72wSHDM+KsoG1po3sR9/ENISk1Md/Dw01RV4VLxcG6Hp28NvoDNUAM
         EVNE8BIFVs2MYPmuNBAjQe8WJozc8kU0Gtz2BZx9A78YgyXEs70iskfVxn4KYrJscBXN
         d/fyWZByBecvb8D8hu2vD/6i6VF9gb89FOLXuOk9WV1TlaLHqbnP2y3Uvo6QRvJ1j2y7
         soj065xv8TiWsFj9Piy7aKu9Mkhf+fH1MKK/2xKPfyuRC7szDLbFbIN/vUA4CfMvj3Iz
         Y7gCoIUOrJHvVlEt1xqTCQeGC1Y3N+7CZQAR6TC/gjXgaZVjOqWDgoXwKDxzpxRacstA
         nX9w==
X-Forwarded-Encrypted: i=1; AKwUvBxHNacYrUW9jp/wxrCanOVpmKmHxtdqM+bcxmY60EWID3v/UWZPsc5AU6NZP9org+wrXmc=@lists.linux.dev
X-Gm-Message-State: AFuF++meVTE41FXxjS5FFCn0A4cN7exqhbh9KaveRVDjtCSLe3GQnTQ3
	SZLefhlb0R7KrzQQrT8pe/SzVqMC53BkwlIx7mDo4k30+KwCDcQg+q+8mNA337kciG6LONwaKq1
	ryMIkek/LaStX639QU1UYbRDAVH77oywyvyjhyPl/lBlJceOD8ZcmCw==
X-Gm-Gg: AYBFou3TPCKiy+jwNVF/17uljrK5BQR0XoTy3x2gKRovDM2Ytibmz5iHB0l1alfCur9
	aovY87eCiY81iHBP3WM/dX1a9Q5xHGGt3r4Cog9y+KRpbTrNQN2nB/KYVa6LCONTSCZHZFLvG/R
	/uBXUwgSm0KMyyHAkmcL/L25fpj25Jfb09mJvUuaovVwyDn9SgOnr9Qdsh8MupZ9wpcaxWFjqvQ
	JGlyidHKLK8SJBqcP26NctVa2FtJAi0NAe6pzQsnwHm2Dl5IdL5BcGKLx75PWj/3o8RXdrFqXvx
	R+AUjng24r8k3ohQcD3Lm34L50ybHOlyqHD+LkunRJA2BomV/dj0jom6VVEhf6nnSYYnVKtkpy1
	uysoA/uTJmDAEkqEIIQwyfueEO/SZdkdaBUGbKet8gvcFKDT5W7QRh+Wa6A==
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857935e9.21.1789377835296;
        Mon, 14 Sep 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857405e9.21.1789377834915;
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm399519375e9.2.2026.09.14.02.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Chen-Yu Tsai
 <wens@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Philipp Zabel
 <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob
 Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Yongxing Mou
 <yongxing.mou@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, Chris
 Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Use consistent indentation in
 the example
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:23:52 +0200
Message-ID: <87pkyg1907.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tPjXn6b34RID0XfZPCPtH7H7sqwk2H53wX3k0FNRs-8_1789377835
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

