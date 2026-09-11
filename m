Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1695520E334
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 04:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099349; cv=pass; b=jNQNUNwtwKboztbtgzhm96COk0eqMHgVjmo1RNsiKd/GHfWel/iqMJZBGaBpK19Dc/Ywyd/OR7uEUbCPKcwAGg+SqPK81slzbb6TjNyAdiSqRmgz0rxLgzXkGeSXDaZ3J1dmcIY+w3olODaVyFp8poe0rWYOlpz0IvfnINTM1NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099349; c=relaxed/simple;
	bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLND0nuN7iY+lRlxz+ocLa/w6Fe1wfhsnt1IIi+/KRpHTuwt+LE0n6BOS/M/D/+h9sfg0qfjzP6TR66nuiYMkUxbC6liOLPA787m4QN8/wokhBdwqncPCOMJSM0v64Re2QBDlWCpkZTQM5zPVBCcokz5fGAptqK7rTzXFBdgdYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY1hHt1c; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY1hHt1c"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d715f4a587so5737065ad.2
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 21:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789099347; cv=none;
        d=google.com; s=arc-20260327;
        b=LdQeNrc+wcM+88iMq8NuWkUvDjPoSzhlYjRLuSTANrupTOXuZ1D61vG8iEfpQ7llRG
         u0DPPvy+LID6RjMHiFAClgK9vefZEem36dqRbXiOIppf+gff4fcscGrV9ErYKK/fGPIG
         R60c1D3GELBpdktPcDjAYkyuPvmnkfOHgTn9QW5jsGFyz4wCVes73SkIPKnBJzKeIgSP
         COeq2Udw9JM858uJdkwjGhLwrad4zxQmJDSNU1EvJZdy1fMaP2y65xn2ltMsi1bZP1+p
         CwxV3gHuA69HtJZgyZyvXLVpIJWanIT/bMfuoEcYpltGRiyel9bctkV4zapNqUys3LZn
         ROdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
        fh=ZNfPQsSE2rPnjPkxkn86D2b7DOqVLUB0x/udkF5G68E=;
        b=nTNqnLyP7BMnIm94SPqTg+rj72AtCeGFmP3/2Y9cb8VvxJsrM4IbCu1JO9RFoNdTL3
         sfphaJZ79gVDRqFqzVUyubg0SDR0dTVrRyeI9l9wC1/yLGvC+6sI/xnWQupR+EC9BH+f
         XYHHP+ej6GdogHVDG9yyws0PFCEC/tAcyCV+ha9G8SHkBaqtRqzU2WfUdzxAFFxZDdUp
         PUINs46ma8VfO3OOsXrAmX4n7pB2FiumiIPi8zlIU6S5HUhjrCA5CPpvePhtsPiOR/T4
         G7g3sbr+iLiLvlv2DMsVL9sNJvTV1QgnGgV6vdObNxf6g8w4lYeE690H0Etd6PqbBTQL
         fYZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789099347; x=1789704147; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
        b=SY1hHt1cHLxkd7eK0x89jOyDN9Er7EIzbFYesp4ZAPWXb26BZOXpTodYy6U01Q3THf
         D4nhIccKTaFKdR6b37zd11/anQkQSZMe8DkO/G9KABdQhvX+8Z4KYUA4Asf94kBFnWUZ
         Q+sm2RcRJ5VC526cbFuRiO5Z20G4Zg6AdS+xxaf5YocYdRjPVDmmJjMSkb+d8F/4gkNE
         JF8w9fxCv4ZNJE+dYxEsjSWjofHAjp7p8geheJd8jWp5zRE4IVFoOv0UtCsrXEZ3SAXA
         vVNK/tULc1xhTXCVyRyL+bU1lwQMP+CjB3FdoZXXlCjXTtG0NFzb48YQb6Rkn+n21KvU
         nGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789099347; x=1789704147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/unsMahU5AWxxZKqAdHfGOlD5WJuLIUU0biyoYkbP6c=;
        b=Zaa+2o9H6V5+GSS/cdwfY4RxG/tShiAjHYE4dKiCQwRtVITn2eEflwThmdkmZQ7aC8
         UUiuEjOEBV8XdvEcdDZsv3Qgboqa1riyD33yjk5dCCWlp1KQuCNfL0NvGdT9dZuyYlVU
         WyeaMZ4cbk0ua5u6+sX428RQzPVGFcVdxg/C3mDdCAjeR9hpFbJwN0pSYAhzPp7DHrwy
         mIHuPumZxWWpc7gsv+wOxAbw8nZCT2/DsG96qOEkNNV0qYdgK/yKmzUIE14stqbqY1D2
         TrJrgyceqYF19ATm6aVZgKXei9v8D0uDm8c22k1NHIjn9DN/m/hgvZ+Gtwfgvaj11Cin
         OWSw==
X-Forwarded-Encrypted: i=1; AKwUvBxIfsc3xPz5Yb1wAbGcuDjANc3PagFq+uEEpR39KgkelxegsDi2T+eNXYynWg9xqv79ntE=@lists.linux.dev
X-Gm-Message-State: AFuF++mxlFeMjJg9tXqQurzmBYhuCyEYaAsRy+VMQtT0LbaZnspFVx2O
	xJ6xc4JM65BpmOILYXVtugEVXqbGD2RbQ6C7XwMy1+tsWXh/ty0cBrh6ntIUorC77X6/DcGYiej
	coCB72DcNqWCtJwBrs0cXn6m/fOU4HcM=
X-Gm-Gg: AYBFou3WlPdE/V4yRO3tl7UEOJC0PolU593PIcc8wSwtydD7uXagGAsFgtj7HOeMev0
	uApPIQrybSuSBOqj83io+iOeL28GsZh89a8HSBDL1hfUNyIjtQeSz9O/Ljq4IafmgQD58m2VPJG
	nZWMEz9RoBSBvWr0bcNOpy5e89mGFYzRYjpIvr0cuvgI574wjozle/R8gHQKE91ekZWzMMJrHhH
	8q3zkkcpo+VhwDq0A5MLaHwW88TZNJLnGmpr0HVdhpBM6BeWSs2WD3dpTMMqr+rJAPzuaQcc0cT
	91BKSPff2fIgD1YxfsxozqA1NSmxrG6OgFQORZSWBBsuUQ0ePTQTuFwmo8fIoj3U1AbsySG3GMY
	Dr6lve3vFojLWjvL2CEANW3qduoUaaflJJ6/qbaneb2heN/hp7Zrn5vNjEKVlOc4nW2s=
X-Received: by 2002:a17:903:124d:b0:2d9:3bee:4f32 with SMTP id
 d9443c01a7336-2dd2a45889cmr41780545ad.20.1789099347397; Thu, 10 Sep 2026
 21:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909064712.22539-1-phucduc.bui@gmail.com> <20260910180733.2d4d48e9@kernel.org>
In-Reply-To: <20260910180733.2d4d48e9@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 11:02:15 +0700
X-Gm-Features: AcwNN1XnERV3Y99vrub4Kb9Mq8NYZCHahFiWxUXpMZS4wj3JAmLqVaaCGWrPlw4
Message-ID: <CAABR9nERt4w_vKgnYRS5+fhTQ64yJW7=vfyBBi_C+PLmNVfzeQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] net: fec: Propagate PTP initialization errors
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Simon Horman <horms@kernel.org>, davem@davemloft.net, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

Thank you for your review.

> > -void fec_ptp_init(struct platform_device *pdev, int irq_idx)
> > +int fec_ptp_init(struct platform_device *pdev, int irq_idx)
>
> This function has a kdoc, you need to document the return value now.
>
> Please repost this for net-next without the Fixes tags.

I will update the KDoc and repost this for net-next without the Fixes:
tags soon.

Best regards,
Phuc
