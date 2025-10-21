Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D06279792
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031303; cv=none; b=CbKypys7a04Ro6OtB9I7cOF68MzdRJGMr6eWiqf/w/3wHH8mVcm+Hw2IAzcTph/j+5ssQkiDTzNRx4lMnYXRzjRoFqYlI2bOskrEMk5ptgfU0M0GR+4CRzYpHR9vVVZ93QbLUFEZ+rynnTNw6rKH4mWJDAGU5eHqr5MZhozxdCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031303; c=relaxed/simple;
	bh=AY4vlSigkAu3MeDU9Ovs29Ds/Xigd7mN+cX5NsRteBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQX98qmwJNJaXqXNTuBZVeraw7QaP9dYY4TUZvmqbJpKYkJO2g640Nr/2eevA1AnAcg9JHaHVytZ96SUwmhteCpo8E99Q2sJGAqZ+a6UsCDPNjPde8GTUbdSCPVExSzYB0EV1ht2AS1hXr227pmCIcfildJZ9d2sRPKDuqOvvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7ecpmPO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7ecpmPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761031300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfnRqiKEelMSphBHduFrZUqhUrnjzFO9LXcBFI/UlsA=;
	b=P7ecpmPOU94cZbRy1GbqHLI3C0VsYXa6mSI6UwID0xD1NawxAtPGNl+tWwmvfTNiVmz85g
	s7hxFKIHWZjNbZJZYKjwqxN0StR2FbnIT+XnfifORLCcDyqON65/UTP+oSofuV+l8LN0Ii
	47jOnwvnt790GkafCs6cQnzVNmCcWvA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-qmTOwIqzPCS-8bRu_A-KAg-1; Tue, 21 Oct 2025 03:21:39 -0400
X-MC-Unique: qmTOwIqzPCS-8bRu_A-KAg-1
X-Mimecast-MFC-AGG-ID: qmTOwIqzPCS-8bRu_A-KAg_1761031298
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426d4f59cbcso3286511f8f.1
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 00:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761031298; x=1761636098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfnRqiKEelMSphBHduFrZUqhUrnjzFO9LXcBFI/UlsA=;
        b=BTld9ho9sC1rsEsipFFSFBdFeVTaEZEELaAloqYWgAFdsTbXVnTTAS1YP5e7dFHG6f
         KfQc9QtG0X98Bwccxygbhk3ObFbKzatiHcjVZaqO3ZQlKOkJlWVg69kbWkrE128ElpIM
         6459S6C6iXYUsClwLqWT9Rwyf6fXlfOTykPMn+N8aFS5bYTn/0x4YyEwASv2yhyYZ4Wd
         7G9HoJ4VNP9UYiuAODGRpy20eS4Mkx8mfhZViMOmafENgiRMtMxqBmlybR76oEy+4TMt
         ULzrvxetAr3qzPk0uCbmu0+NizuMNRivlNjxd99MtoIfp5NOMIRKcXUS/KWeFalO/Sps
         xzIQ==
X-Gm-Message-State: AOJu0YzxD1V3WwkLkKaQpi3S1jIrWmkCkDuLNpDO0uumcC2JcDPO+Elk
	ydPalkzaNRYsuB1FiAFV4PuSvk1uPmf2eHlSZCOO9A5slxXoLrNiqyGF0GAG+gw4GoBHeQMicGz
	ZeoYPvrFePg/N+mnGKtJMURl2Ct1pDCo0oqD9G8VmsYzo6GAWOz6L9Q==
X-Gm-Gg: ASbGncuJLwldSDzSmRQVDvgoYSTYhlZBAWbZuZRvOZObgVITMdQenJZVHp7QBTGKl7b
	8f1EcvoDb9HrAlu/HMl/2/wl3ua2Aguxk0U8OwyWVfXrvxLg+106Ly0tVnCSJfXOCpWFh36Zdb4
	9adBFzZHn9u+COi6pOren2/iimURR6EsrjyrDG92DRWGUVdoJzEbFRs0OPavzw69ifURyM3bDpw
	0LaFw+0fo6ajsdZ7FWVbSO0M9GRqoYXQcN9GnXgy2pzEWr0qPg3eYlP08dZe0Ay/ZhCGopH3FPY
	oaxc2Tc7Vi3zcxduilfh/2SuoYf14QudtC0itS7SvuYua62Hh/L9ELi0CecmnPig9C6AabRoZ9Q
	h2ol6XlBEBF/MSJ9HSRcaYfqqfKfixWx7Vqm8RFIIkAFvtTQ=
X-Received: by 2002:a5d:5f95:0:b0:3f4:5bda:2710 with SMTP id ffacd0b85a97d-426fb6a7461mr12855826f8f.9.1761031297976;
        Tue, 21 Oct 2025 00:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDxfoSFLan3voMA9n/iCNlQKxAGKdDWFt5/7nuSlMdSyP4+uV6cZzpLp5Db0jFPI6pELrtOg==
X-Received: by 2002:a5d:5f95:0:b0:3f4:5bda:2710 with SMTP id ffacd0b85a97d-426fb6a7461mr12855798f8f.9.1761031297518;
        Tue, 21 Oct 2025 00:21:37 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d972sm187420125e9.1.2025.10.21.00.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:21:36 -0700 (PDT)
Message-ID: <6e62af59-b282-41c7-9275-fec3c5d479fb@redhat.com>
Date: Tue, 21 Oct 2025 09:21:34 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/8] net: enetc: add ptp timer binding support
 for i.MX94
To: Wei Fang <wei.fang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, Frank.Li@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 richardcochran@gmail.com
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251016102020.3218579-1-wei.fang@nxp.com>
 <20251016102020.3218579-6-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251016102020.3218579-6-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Av8Hf76pYLO4JHPEtf6PkRBkc0M2Z-IPQ1PiU7wXq-g_1761031298
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/25 12:20 PM, Wei Fang wrote:
> +static int imx94_ierb_init(struct platform_device *pdev)
> +{
> +	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
> +	struct device_node *np = pdev->dev.of_node;
> +	int err;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		for_each_child_of_node_scoped(child, gchild) {
> +			if (of_device_is_compatible(gchild, "pci1131,e101")) {
> +				err = imx94_enetc_update_tid(priv, gchild);
> +				if (err)
> +					return err;

Minor nit: the indentation level above is quite high; you could reduce
it a bit replacing:

			if (of_device_is_compatible(gchild, "pci1131,e101")) {

with:

			if (!of_device_is_compatible(gchild, "pci1131,e101"))
				continue;

There is a similar occurrence in the previous patch.

/P

