Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8853EDADA
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289191; cv=none; b=QJrcWPQRqgDDL5DI/2pC0O019JGNb+qGZbKn8eo6VzAgge4S02x5AFRqXgmbGYAVZMj4qIPJY0MEcXmjNmQJNHgn6sna1J1YsJttVNRPXauVZcrpHApQj1lUaM3nEkiFCOA+k7XcIUMXmfZURhU+f1dExVNX3u7TjcNMxa3bw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289191; c=relaxed/simple;
	bh=wXG5LQXJ07OroDz+CuOeRV0aSjihJMOZsDY7ckx3LY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KydzDEXw728t/QTZMf3wywsPF7g82/l3nOUW6KwR6Fn/Jq1OhLGigO/nFo6x7xNhcgwh/fqw3i8Wtr0O9boGRJdc4/Kp+CsKTnDBGuy8aGnj81eLeoDm6EDvpqfEWAEwABBoNeW3qrNACTbWX41iIxRurT7MDrkjz67pPGgoxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/p5bTTf; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/p5bTTf"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6a116bd18ebso2361462eaf.1
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 04:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784289186; x=1784893986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IQ4rZYCXmoKGNhUGfrKCmINcJDQqtVyHwlnRNnG6X4=;
        b=E/p5bTTfVfDnPgfRoWL2ld3jApAfMt8yjNWUg8PgNyiSpgDm8rKMhj5kI/ELCoo7Lm
         T6aKUabzjOpCIyiIRxD0jTmY5Akr+I1WBKsCKO9yURmdD8EdPU5yrR05J8X50JqmywM3
         eaMa9OKLm009SW5BMFKvrh74jP4guYuEgWjPzPTLpB+1R1vSVlDTDRaaDHln6HI5tjp8
         s1eo+94y182EQZ8IPk4uMai5q1pGAr1fxN/pIyZ4n3v0SIdXoeNeC0+hQV/vKIcMT5uC
         udDnhS6/ZSB5EAe+yCubUDj3+Q358MK7WApnADSwgx4ZjhSvEDIrPKBkZnYtTdYaN1p4
         qfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289186; x=1784893986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IQ4rZYCXmoKGNhUGfrKCmINcJDQqtVyHwlnRNnG6X4=;
        b=sedwvpDnyZIQoe0uWrFhPCYIXjppuIBKO1qW6QccR8LvSH+ZjiBhNGGyJ144ldjVXk
         zeRcyotfv5xiYfqFaEW0LI4yVMOETIb8mUBcPY4WDh7qj9E40OS6TooawP+yhNpqBSGm
         KzUXf099SjUthX849UE5wH3lvEGQExbjH5D+hlYxc7fq9dO8WkqOyzisB+eUI0uwY3Bm
         BVino6ogL3tTJJ2oajWcEMSztqz4F1Vasz9xCNKdCzOQKwijjVbESR5Ez+UqODGsKvWy
         3TFLn//RxE2KCBtIf83Q0DdZzAayF6R/gU+nBdG5b/yfqFcMyHUjVpab2rW124v82uLQ
         3BEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/TBuK1xNfqV0BwN69sDLZYWThCH3wghICThJxHe+8jqPcicW5PXTSAFjdEozTQyugdT4=@lists.linux.dev
X-Gm-Message-State: AOJu0YylenaxM9+hPvac5K1nUNWB7vjps1iTCopBQHmVM8x1olXvC6qL
	+JS7T7blzj1ABA0V64D0x8bMGM0p/NnUt+cP9af3DipnAEV/qgT0z6Pi
X-Gm-Gg: AfdE7cmbfp0/cRaeEak5YIGAs9Tyrm9r6UHzRXLiTaHeO2RpUnPQauV8tB4pnjDbfa8
	SHGUVP3rr98HUU7NgmuqHP5aEtwQ15GW1g+t36I2ViVQ2TR8hSWPMW1PwsZrIKb82xQMR9NQVUx
	oZv18bGJZ2NQo0RDsbLx47A1MQ9bod+8+Gyt/pPto26BVtb4vn/vRvnelsnXHZNHeCoHrzCKP7S
	CwMt/kMvu5GE6daaxlvOJqB5gpWAftxnWbQSYt/tej4HuMz2LNhjBvpJa+k7TH8YGTCmIwjpm31
	/crLcdclupsp216TYXBtc5yFTlWgDFCGpORJn1YtgejBN6+PddRhTu27i5eAhf2jfI+OjmI0IXF
	Z789DnIZnsGjV9dZVkRCJa3SsM8X0oODZfiA46sTj2k6RjrOgpmHsJdiUgYcq23gioNIeXw==
X-Received: by 2002:a05:6820:1621:b0:6a1:805b:5288 with SMTP id 006d021491bc7-6a53688627amr895125eaf.33.1784289186437;
        Fri, 17 Jul 2026 04:53:06 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a516bb70c0sm1151776eaf.3.2026.07.17.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:53:04 -0700 (PDT)
Date: Fri, 17 Jul 2026 14:52:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Luke Wang (OSS)" <ziniu.wang_1@oss.nxp.com>
Cc: "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"ulfh@kernel.org" <ulfh@kernel.org>,
	Bough Chen <haibo.chen@nxp.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	dl-S32 <S32@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"harshit.m.mogalapalli@oracle.com" <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH v7 8/8] mmc: sdhci-esdhc-imx: fix resume error handling
Message-ID: <aloXmhWN5QsqNcxM@stanley.mountain>
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
 <20260715071818.272318-9-ziniu.wang_1@oss.nxp.com>
 <aln_pFNqL8495Y_a@stanley.mountain>
 <AM7PR04MB6870A9E6138EC8F7C8B23E53EDC62@AM7PR04MB6870.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB6870A9E6138EC8F7C8B23E53EDC62@AM7PR04MB6870.eurprd04.prod.outlook.com>

Oh, heh.  I missed the entire point of the patch...  It should have
just been:

	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;

Another way to silence the Sashiko warning about missing cleanup if
mmc_gpio_set_cd_wake() failed would be to add a comment.

	ret = mmc_gpio_set_cd_wake(host->mmc, false);
	if (ret) {
		/* Just leak. It's fine. This path is impossible in 2026. */
		return ret;
	}

The other change was unrelated.

regards,
dan carpenter

