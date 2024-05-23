Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A213D25C
	for <imx@lists.linux.dev>; Thu, 23 May 2024 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455701; cv=none; b=OI5FZzFqK8B58kLh5qRvXqFBhYgu2d2EMfxe8lIMerqVsmoopMY6zZT4/JsNSMhr6eZLXw8SGaTMdBImV6rkrVVtYd3YtBOjigkqrK+RaZyhoxw9sKVgznFCCObyDeQkiHsmCKBUVUqWjqRIKtqSzVgJfRlRvNGa7NXIIQtJWPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455701; c=relaxed/simple;
	bh=+xXBvukX95E9e4ipu/s6G60p0crEfIIK4lAUN3F58OQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcZw8CHxcwNBAR5npeT5gWJXR8MncoofQnKvtwkuDa7BYs7yA9q2dzYvFmlp9SKzPyuEJ1sIpLwfUylCS2JLgA3sxkX3q2IXZuALa66dVDHfr7PoIUYAwfe2TLj/YzzmCAZRV5YeA2ipQvNiIpTxtX5OOVU9aR8lbaPdSULcpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+CRTKbb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+CRTKbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716455698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=epQDt9Ntx5o2wdDteGO+4f7t6jbg3i32CEQTOpoMqhQ=;
	b=G+CRTKbbSUieaFGH5HV4h2NY6sMjMxiLki0Lh2pM0bE8NbQdSY/KqTfa1nHmYwlJ4mjrtG
	wjq/SgBegCbdBjeU58X5xZ8rLjoXVb7nwKrr40DdCO7O6SUhIsdemxg39iD1J0dmwtDCEd
	D72UBTliNmA1v71mMWYZOhEKFK5pL8E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-i7XKvbcnNx2flnJZyl7uDg-1; Thu, 23 May 2024 05:14:57 -0400
X-MC-Unique: i7XKvbcnNx2flnJZyl7uDg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-792ba913db8so23602385a.2
        for <imx@lists.linux.dev>; Thu, 23 May 2024 02:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455696; x=1717060496;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1PA5QvJHm8ykHTiGZm5aAca1OGkhXqgReaXY3/hb/k=;
        b=nPr+dJJlOB5kSHPY9g2mA+ftVXzwoPP7vbeZUKhbSjQ3+qKInAoXcWQDcdZ+zMmDAC
         SWyHi/2Zaz/ObBely42uGVkqYqRpIt4TRER4jg4MRLi7Ja9lWMWBU9fp/Pq5y8uDRWa6
         GcMEbEi5mNFwkCZbT7ImyTTzrCgryN/w1b8dJH4hnpJCHTOiqKKwPxPkjy175vIUZCxG
         j+CHQ1wlqtQiXh5rvbhytIFun4cT8kNQCr4iM/Z3QzsT1MqAe0+SzpFI7HPGNR0LwcXW
         YdnsDugMX83V32Ic2iOCuoDTlinrpjWmEM1xycfDMOePYWAFTmC3n2zX4CO5W+ZpKD7v
         CFIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFcwFggtC8xFOK5/jztmN9gk7zE33tc29L0Z3LohJ2Q5zL+LWnW3DKxIrrbA8UYxGf2z97NFwLCebi7X2ZtqKuDw8k
X-Gm-Message-State: AOJu0YwcYjKJl2hpLpcmzV1qz3PH2aRXIf7MnpfH6HhwoEJ8Q9dxMmmb
	pKhBkbnGXgKqq/+Sjz1wupIVsg9t2EZd4tyEiUyy4JKVhiENzcTeKGtJnbKUME/K++V/W/kAbAf
	SSQVggaoyhVDSNjQnHDxk3HuK6Dpa+jngzP+PdmRFliErSyo6Iw==
X-Received: by 2002:a05:622a:1a27:b0:437:ca6d:13f1 with SMTP id d75a77b69052e-43f9e0b65e2mr43549861cf.2.1716455696236;
        Thu, 23 May 2024 02:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElwc+jZj9lrO25a2CjKzzWCgMw9ch4Fg63jKPkRB/jxh+xOlJFXYNQENPC+6K3Ua0ypfW6GQ==
X-Received: by 2002:a05:622a:1a27:b0:437:ca6d:13f1 with SMTP id d75a77b69052e-43f9e0b65e2mr43549701cf.2.1716455695822;
        Thu, 23 May 2024 02:14:55 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10:29ae:cdc:4db4:a22a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e09f7862asm156096621cf.91.2024.05.23.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:14:55 -0700 (PDT)
Message-ID: <e21fa14dd33ddac7dcdd08a50fcad3f87a8f76aa.camel@redhat.com>
Subject: Re: [PATCH v2 net] net: fec: avoid lock evasion when reading
 pps_enable
From: Paolo Abeni <pabeni@redhat.com>
To: Wei Fang <wei.fang@nxp.com>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, shenwei.wang@nxp.com, xiaoning.wang@nxp.com, 
	richardcochran@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev
Date: Thu, 23 May 2024 11:14:52 +0200
In-Reply-To: <20240521023800.17102-1-wei.fang@nxp.com>
References: <20240521023800.17102-1-wei.fang@nxp.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-05-21 at 10:38 +0800, Wei Fang wrote:
> The assignment of pps_enable is protected by tmreg_lock, but the read
> operation of pps_enable is not. So the Coverity tool reports a lock
> evasion warning which may cause data race to occur when running in a
> multithread environment. Although this issue is almost impossible to
> occur, we'd better fix it, at least it seems more logically reasonable,
> and it also prevents Coverity from continuing to issue warnings.
>=20
> Fixes: 278d24047891 ("net: fec: ptp: Enable PPS output based on ptp clock=
")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> V2 changes:
> Moved the assignment positions of pps_channel and reload_period.
> ---
>  drivers/net/ethernet/freescale/fec_ptp.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 181d9bfbee22..e32f6724f568 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c
> @@ -104,14 +104,13 @@ static int fec_ptp_enable_pps(struct fec_enet_priva=
te *fep, uint enable)
>  =09struct timespec64 ts;
>  =09u64 ns;
> =20
> -=09if (fep->pps_enable =3D=3D enable)
> -=09=09return 0;
> -
> -=09fep->pps_channel =3D DEFAULT_PPS_CHANNEL;
> -=09fep->reload_period =3D PPS_OUPUT_RELOAD_PERIOD;
> -
>  =09spin_lock_irqsave(&fep->tmreg_lock, flags);
> =20
> +=09if (fep->pps_enable =3D=3D enable) {
> +=09=09spin_unlock_irqrestore(&fep->tmreg_lock, flags);
> +=09=09return 0;
> +=09}
> +
>  =09if (enable) {
>  =09=09/* clear capture or output compare interrupt status if have.
>  =09=09 */
> @@ -532,6 +531,9 @@ static int fec_ptp_enable(struct ptp_clock_info *ptp,
>  =09int ret =3D 0;
> =20
>  =09if (rq->type =3D=3D PTP_CLK_REQ_PPS) {
> +=09=09fep->pps_channel =3D DEFAULT_PPS_CHANNEL;
> +=09=09fep->reload_period =3D PPS_OUPUT_RELOAD_PERIOD;
> +

I think this does not address Eric's concern on V1, the initialization
still basically happens in the same scope.

On the flip side, quickly skimming over the ptp core code, it looks
like that the ptp core will always call this function under ptp-
>pincfg_mux mutex protection or at device unregistration time.

AFAICS that makes pps_channel and reload_period update safe, so overall
patch LGTM and I'll apply it soon.

Thanks,

Paolo

