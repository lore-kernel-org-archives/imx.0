Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48122839A
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822285; cv=none; b=EI3fsqBuxRQX8PWYoHGC6jmbVAV0NFRr7mA6E4ZFTwobg4qdVFNDMehkVvw9Viva8MrqV3x0h6jBw53BJpnd51w6MhS6Hw+pYqeBuQl3QDt9iBkrZxzoZ/afo0WRbE5GtzI4+5cJLXBAJliHlutzr4MtGoq6/P45a8n8SWSDcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822285; c=relaxed/simple;
	bh=xs8tc8DARrkvnlKYhwS5g6JwfwaoL0omsEX3mEYryYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrtV/8sW0zs/EK39Qn2yb+jQYKbQibV9lH9gcQls8Iqm1JvDpril4nCQfs7yvY9zoEYMRcRnJik48K2y+8mY3QPnqpMDq1eRagfQlX3gvUkxl+OUQieAUGvB8I1rq5C2HmsqHSb3FSZR/6/uvLo1D0MmNHQ3DIesiM0yw+9FjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHPKfZ51; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHPKfZ51"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1367011f8f.2
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822282; x=1750427082; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ha63WmYrBhrwv1Upra6Vi8R5v2qxwHgIImmnm0aSZ3E=;
        b=lHPKfZ51LMqJbyFDQumqxHhjNrxVVSMOiUZVVgjjb5LHHnwvjgFGfX/wc5x5wAg1E9
         fAcasNb8Ge2ENMCjv8R+prjdBullXa5+nhmEGLGdYvFIXTDk346/FsRHJ1bF9rYWAw8v
         dUyDpVPkY2Hktq0qicRNuVIJqfN43N4q0ZFl+QYuI2vxhSOqS+9G69YC2HkD/6IdTlbj
         PTfBHVf0Jq6Sf1kKaDWe0Dd6+YYeeb1mDKNSs3aADov6jAdPjnRdnq1h7E/HN9shB6Kx
         gNrnNDNFv22K9KDifWkF52eiKj8VyWYPLCpVldhaBCALzOsG8XE3WokwayL9/mPznQ8i
         I9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822282; x=1750427082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha63WmYrBhrwv1Upra6Vi8R5v2qxwHgIImmnm0aSZ3E=;
        b=F3asGx+48pf50R5FFrjX+LgWfkpkMs2CW3EtikxIPEfA4NsbJs2mNFV1n0bcV8ygfh
         xSHcmlRKKr5FXXu6Dw4vmxCIJqJ99vZ0TMzGh6EZmKS1+F4vPQOJvQ694a1GA2ZPnxsR
         EDxheKEvQkwxyqNNL9qE09lq1IPN3W58moqSLQBan2ZkbAyXUz3OpMHeWV7us+qUF5J1
         rxRNN33m9kNIJJmHM+rF+DH0vVZNhw+/1VTrAQYFK2EVSP5XmzwwGf1/95bAQSTCxevB
         jXK3bMauZF1R8prEPb/sVG6slyPB1gmJ54m47axfUFIyY9xw225yDUwKbnn2HfufppbS
         A7eA==
X-Forwarded-Encrypted: i=1; AJvYcCXZZT+3KxI7rKesuXThERk2N63frsXj8T53bOYqpRSu5OVtEkH2pV2+wkkx2lNAfuvLgzs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1BZITaO+Q5ABNa5GZsWf88EgjQRIVC4Qjv4U5PrRBMtQbZu2g
	3cRjNjTpa1iaDvo0UkA984OfiF3Xm5ZSTCu1CzHni+nhok/SQWJBgl9T
X-Gm-Gg: ASbGnctvUcz+edPOD4v6Nq+xecnBZvi8URI+Ou5VSZaxIAGUqi8KeoFuT0vt+MMQEla
	vR4kdbqdLgNNf+89r6XDBckKZVeInAncIVBVe7Zdw0PUx8JD3wdy7VMDJU2QvbUqbrE+fJsjmWL
	5zzdo2HdJi6dQ4uPAqCS0xHqKfNQxXmj/nYSWupAc/IvVZauaU9oTWMa//3Ha7B3mIBK2LNMgFY
	RQ5cbdDiwTGHFxX9/LyqGpY9xennpbLlejlSO7m9IBfvG5S0et5atfcP2FPH6bj5Fcxik1C72ta
	/AVaCfAfuOLkWIMBEabpzfGLdVAL+SK+No2GzqXUz231esZxh386XqPlppr67aJabyEAjwjBOyf
	qJgn5n06HNFRsR4jkp8bmFkUvM4NHx97lwCF59YYdNt5l1hb5Z7D/NY3Iy1dU
X-Google-Smtp-Source: AGHT+IFWhrTkw4ZNzuScntWEkfW/AQnL1MBwaRY12aG4R0UJO8cBwa+vTq5mH1DrVorrMEmlDlLiDQ==
X-Received: by 2002:a05:6000:4027:b0:3a3:64fb:304d with SMTP id ffacd0b85a97d-3a56864c20bmr2825197f8f.12.1749822282088;
        Fri, 13 Jun 2025 06:44:42 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5689e5f3dsm2466959f8f.0.2025.06.13.06.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:44:41 -0700 (PDT)
Message-ID: <6425933b-3b17-4509-86be-be4a75f12e17@gmail.com>
Date: Fri, 13 Jun 2025 14:44:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/6] eth: sfc: falcon: migrate to new RXFH
 callbacks
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, bharat@chelsio.com,
 benve@cisco.com, satishkh@cisco.com, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 bryan.whitehead@microchip.com, rosenp@gmail.com, imx@lists.linux.dev
References: <20250613005409.3544529-1-kuba@kernel.org>
 <20250613005409.3544529-7-kuba@kernel.org>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20250613005409.3544529-7-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 01:54, Jakub Kicinski wrote:
> Migrate to new callbacks added by commit 9bb00786fc61 ("net: ethtool:
> add dedicated callbacks for getting and setting rxfh fields").
> This driver's RXFH config is read only / fixed so the conversion
> is purely factoring out the handling into a helper.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/sfc/falcon/ethtool.c | 51 +++++++++++++----------
>  1 file changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sfc/falcon/ethtool.c b/drivers/net/ethernet/sfc/falcon/ethtool.c
> index 04766448a545..6685e71ab13f 100644
> --- a/drivers/net/ethernet/sfc/falcon/ethtool.c
> +++ b/drivers/net/ethernet/sfc/falcon/ethtool.c
> @@ -943,6 +943,33 @@ static int ef4_ethtool_get_class_rule(struct ef4_nic *efx,
>  	return rc;
>  }
>  
> +static int
> +ef4_ethtool_get_rxfh_fields(struct net_device *net_dev,
> +			    struct ethtool_rxfh_fields *info)
> +{
> +	struct ef4_nic *efx = netdev_priv(net_dev);
> +	unsigned int min_revision = 0;
> +
> +	info->data = 0;
> +	switch (info->flow_type) {
> +	case TCP_V4_FLOW:
> +		info->data |= RXH_L4_B_0_1 | RXH_L4_B_2_3;
> +		fallthrough;
> +	case UDP_V4_FLOW:
> +	case SCTP_V4_FLOW:
> +	case AH_ESP_V4_FLOW:
> +	case IPV4_FLOW:
> +		info->data |= RXH_IP_SRC | RXH_IP_DST;
> +		min_revision = EF4_REV_FALCON_B0;
> +		break;
> +	default:
> +		break;
> +	}
> +	if (ef4_nic_rev(efx) < min_revision)
> +		info->data = 0;
> +	return 0;

So granted that you're only moving code, but looking at this it doesn't
 actually make sense, since every path that sets info->data to nonzero
 also sets min_revision, so why not just do the ef4_nic_rev() check at
 the start?  Answer, from git log spelunking, is that when this code was
 shared with Siena, EFX_REV_SIENA_A0 supported IPv6 here.

Have a
Reviewed-By: Edward Cree <ecree.xilinx@gmail.com>
... but this patch could be followed-up with a simplification to put
	if (ef4_nic_rev(efx) < EF4_REV_FALCON_B0)
		return 0;
 before the switch and get rid of min_revision.
Falcon is long since end-of-life, so I don't have any NICs and can't run
 any tests, which maybe means the smart thing to do is just to leave well
 alone and not touch this code beyond your factoring.

*twitches with barely-suppressed urge to fix it anyway*
-ed

PS: I spent about two hours reading device documentation from 2008
 because I thought it said Falcon did 4-tuple hashing on UDP too.  For
 the record: the 'Falcon hash' was broken (in some unspecified way), so
 falcon_init_rx_cfg() selects the Toeplitz hash which does indeed only
 consume port numbers on these devices if protocol is TCP.  And I will
 never get that time back :/
