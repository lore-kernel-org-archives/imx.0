Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22263F6C2D
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513415; cv=pass; b=GT1vxiLVpF7n+qgUgoU3HgqEoPMKIXytmUV5IxQfQVY5s3Wv1aMDkzYMvgcCT5RXGwzbiPaAJB65tz6ckiuTgybYMIv5/RkwtFGRhVcVyB7XMfdyTRTjY/6JI+DZKz7pyG15zCkNvhxOMdzsUdK9wigqgdlhQxbTwSnxfClb4cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513415; c=relaxed/simple;
	bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kF2PC0SP87RYj6owG1opXqfB6fGvs2RuMV/EC4eKn5Uyydgp6hbwIxR8/0ZhoGYR/eLmP65PG82KTllsfW8DprcX6Vw8csnC/G8OsKacKDI45hE+o9KPkcWJBFAFj6UnMVeCuivZtP+Jjb4v76nCqyJaxd/RpHst4iXNvxLZnz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbYOfANu; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbYOfANu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-852c481415fso825855b3a.3
        for <imx@lists.linux.dev>; Fri, 04 Sep 2026 02:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788513413; cv=none;
        d=google.com; s=arc-20260327;
        b=CbP0tNQkRIit9tUMXZHj/X590dpWsOvIXAGt3S4FWDYhW9edvlMoINKLG2Vso8wovW
         S7qLUEtvwly9HE/4PFIOrGxdwlp6qN8Ir+yBHcmcDOP7Ef8t7EZ85sZ/BBMlQLGs6Z2l
         neIaW6DLZRKhsYO6RtWEXoz6hDdIRm8a6JLcH2iAN8jrRifNKWejpRParGODNsuYTQMG
         ciqfjV2Yznsr60F4TpOTqXokfdI9hTL7Yt2PGHZUCwPMlWkQxKF5gEqVSuxq/92WPz5A
         V+VajTzC5+EYTrl3FNJVi4PBcAqrRLP482OExHOz1pjRLui2IrOGOPBocFU/Z6W8iH6y
         RjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
        fh=hARjjv4idU90vFGr84HioyQXwDbK9FGb2gP1IgtZ1B0=;
        b=mKLfWLXueHMzIBWqcPhpJ3tVd0WPq9lUoOTMJHezIsRaXVmgA5MUaaDo39Urr9aZ9H
         0jmem47NwDsamYAtxAFS0w0e6uQd75jGLm9EP31XBuLfOpZDz3btgRK8ZqDEiEIG+aw+
         7eVEQkuU873gUE3/EwotmVzvRXbBIaDx0v7Owuy7jLevRQbvTYA3/WlnEyiVdJegaRjS
         bsYdkzkWM65A5tTHJ70s52BlaNj4DBpKi/t0J9rEOoCSyhbw6iBgLL3XeB6Vlgt10/zP
         BlLDwWBAZbT1AcPSgAIzK+59Vv4zf/Ft7hSL9z8EH0RMIJ/q/nNhRCPLuZjVlH54hBZ2
         qlnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513413; x=1789118213; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
        b=IbYOfANuCNpy9rTvtHojkEttXLgj1gKDoVY6Eo+vVvbGfH3et6rW6GsOajpN6ECf1l
         92foRUMHQC5USBxVAiS52ugj+0vHi66k7kIylvqY+Qjyz9uYvb7v0r2emf6JCOvg+aYE
         u0y2+aSqHV2AUjIOcCyXNoJ9iRvQ4IfETsI8KP7Cq36bSLGz5M8VGcAGI+bFCh45DWqK
         yolfQpwn9ve0yRZv+IhI00zMmlfQ8n4wRvHZuL743GlNGol1skVbzVIIUSmdm1Wa59x3
         Sev0rLATcJ1OZg9IZsb8CHv7ooh9tebGnRW06gT5pe7/P+4N/IunFcmzmg3rFlfpYiNC
         D7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513413; x=1789118213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
        b=UX+lyffDrXSw1lG6oSVEKV8XHhqUiBm3xSOlTytr0VLwLfWRkwciJW54ss556cQWxM
         7IDzFtffjotO1C7mTdNEvXN+apDYXGTtpQmRWrZ7Hwd/2JLnwUfw20pRE7jehhlKeLqI
         KCIBOsDL0T2Sq2pp2trTQOF4+uXqcCC/cmVniKaVPcJ8FI7DCNZVZ7oF/1VPUXYWA0se
         pE3hGD5dNWNOmXACOmXt/69A9jxe/L/bPXRxeBioZE4ccG5PtLmEAQYwN8SIryQSvspZ
         hnCPduF1FXiRwXG3wGTMIIyGShLLNC8DeVus6Gy2/7KIg+EoreT1rBNLnIRiTfHhx5vQ
         UlXA==
X-Forwarded-Encrypted: i=1; AKwUvByu0A99vhhHFENu2SL9aRIXDqOMGaxMs46U9JsT2/8nfS+8aq6sIaAS7k4dcXt8P+a6hR0=@lists.linux.dev
X-Gm-Message-State: AFuF++kWBVB2Q8dSKyyjHV+dtze/RsDoqa+qLgq2++y6kWvPMfvLkLu8
	lUu1LwHSZXptb2csaN+qlD4LKy8pS8MSvx4ZNH9WKPv2LO+rMgpMCntimz247L3M64dc2rkSoYK
	bQjvSxQurqdRW5wVjUkEFFId7EUZD0lY=
X-Gm-Gg: AYBFou1cr+CQ/ECmQdvVI1bkhR8VwdOpLrCx0Un0Qqdn2VJbD79A1pkQYjl2a+W+G+O
	JQ6XrT5in1+18VK1hkfLSX972HAzbzsP/IjGisDn8dMVvS40F+1xJixj6oS4iNmSwvRAobaLCGF
	Vx86fc7TXdx+xEXjuo0h7maU+Y5J0P6k3iazuIgRBE2yINn1a4n5ADiFLLKbD8pIDQHt2Hz7Rob
	8aNQceN6Oh+YNrvXymgTKaHkudCuasZNTSlDP7tZRpLTwGFmMYc+H+yyT0YsH53LvolDOS7uJgm
	fvTF1NK/Zfw/d64zdHRbwhA5UDMo+3BATM2N/Z66jjKtFkqQN6zWqHt1UmkE244eMfLLiQrMBaf
	F5SYIvyM2cEXXMN8TtsLi9lqIDb1oxyiA/MdqIn88bHgOLYNta0iZTfES
X-Received: by 2002:a05:6a00:1910:b0:853:5152:a3e9 with SMTP id
 d2e1a72fcca58-861692844b3mr6680817b3a.11.1788513413233; Fri, 04 Sep 2026
 02:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
 <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com>
 <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFi06-7=uHmOBFGZv1eUYCskv8WspOdUxbDuQ6vMk68Dg@mail.gmail.com> <GV2PR04MB117399ABD55B1D65AAB8EA42E88B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB117399ABD55B1D65AAB8EA42E88B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 16:16:41 +0700
X-Gm-Features: AcwNN1UyZz0SrSd2LGz8BgfAH26qtAAWc51dgQLrq8UzEPhnn0559XUUTa1qyZ0
Message-ID: <CAABR9nGSi5mty-4AQv_vYz0yqCKE5ALh8ZC7bcFnY99VBfq_CA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wei,

Thanks for the clarification.

>
> It is a potential issue, so the target tree should be net.
>

I will retarget the patch to the net tree and resend it.

Best regards,
Phuc
