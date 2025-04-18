Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2F199EAD
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744986605; cv=none; b=ewH6bRKOTz2nkBMk0yQZR02q5v2rrPCNrMcegWPh9JPPi99yEiemIpOIrb23VwCPOpTLNXnrE8BN+AqYHEDUDrhkezeQL8zydWwm5TdMdZRCKWDK6BwLyyVWWVlcEEffEpTVA6B3DX1V/3w4LfPUFIZZGfP5GKqCV2qwakrSp7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744986605; c=relaxed/simple;
	bh=wUzmH4xqUNFx6Lqx2Itt/tpaeGYM05BZoZ1guKnRXn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKm70yev4s8pBrMd80zeEzGlrEpUY5wy2wph177IH71Vqi0LaAWz//k8k+AkJxaOkzYJS4fQGKFPlCgjWNq9w4YlVkumMYAFW5OtcdoYovv4/h0DAV48Fa3cvzblzH36u114JiVdKNmOngTncRsK80GIqpzF6lUGpYpLit7pclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfcpIbPK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfcpIbPK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3f58b9156so18979066b.1
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744986602; x=1745591402; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
        b=LfcpIbPKxL34ySPEdFxpfj/E3592mM5g5qv8l5Q/qLc4Tp8RY/JYJjOi1JV6vkqwwA
         rEmKM4Xiluprw1MkOiuX+i+KquDrJUPqIhixjNC8OduQcUWNQAdHmrg7UjUKHshX/VTf
         yeahP7VOhGvqc2a6u75vBjt7e3ZomStqivtqOSb5pwJeVjZhs7gQkTXDxhjozPMoWQ9Z
         JltiregMpP2ex+EBSxycC1GDSpFp5fiwPEVCgS/aGAjUr9ELeaxRASS/6tEt3gfr5VpX
         6XxXyLoT/8pOcid3xASlOC+MGfbYFjIsmBnPrBZl9NQd20hpSgeGa7azT+bHSgfvOisq
         ekZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986602; x=1745591402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
        b=NeiKuCqi4cUfW5rVWxuPnqvB2E4W0RKu0Kekfs9O5qwi7BwrG6ItTy7CLo19oBw99H
         dV/MxJu7Sr+afNChiyY9YoD+8Re9yGJpFPFy21PKWe/0Sa0hnm/XzAxK1QiU3jJySnoC
         NEgN6ErL253B4LkbVEvvGawFMkpfLNwVa+uWudFW4bizb4U4QQ/y6BtpFrxoAlXqgWWB
         FUDVieI3n/QE6kOlpnaiIzhBu9oR9Rxq4BnBbBnQS5eL0VqqAYW8MHx4lp3KTxG6P8Rt
         MNUe70JIBZRwV1nfGthcHL2CEsqM4H8p//iMZQoIXGoQFvPy5VzLpEAJJx4ENZBFO7+d
         doxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhFjymb7R7rJP1S/A7hHvVc2v46WIUl6gt9IiiyHTcHIAADgAz986V2L6YjbLDZfMLjhY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy21SW0zrCoSBuG9uZqX0iMtWfjs8g7K9XZ2USyH+Mj3OcfJdhF
	kXps9YWHvEo1brSwi6/Agr60FOsWLniG89aUzriRWgowC65kNddL
X-Gm-Gg: ASbGncv1UGzVrVGptWT6CBPU5YhWQvF9DnTALkaQybDJc9qxRQHpIQO0H0XpDG9CvbU
	n0o3zMP1VT1ch1Yknvoy2i+zvicZUmey5tvOz+hgYF2OIdyZwYo9GWgANtbS9dzDZRjsLYwEzLz
	0H8SQWDtsn3dnuXmW41Ow6DDmjGRC3qOSSCzzqZKRzkclF7uEIYcy0pSBH6RkQxQ9ZZQgQVn/Tl
	wW61Vqv/4l/5ZfwP/AsQ5X9gQm8JXT0r0vbTyOMI5ZKRyqXVNTn/8iUR5vEy8y5cbyjV8pEqkqM
	R4+achEknTSNqi8bpBlec0YVja/0
X-Google-Smtp-Source: AGHT+IGdnYDFhquPDANBW/t8s+v17pRTpxTdgVNlSSlgqLevLyFnxfpZxlTzVSiFWuujrFYTqz760Q==
X-Received: by 2002:a17:907:6e8d:b0:ac7:2aa7:5ba6 with SMTP id a640c23a62f3a-acb74b2d23emr92002066b.5.1744986601569;
        Fri, 18 Apr 2025 07:30:01 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm123261366b.124.2025.04.18.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:30:00 -0700 (PDT)
Date: Fri, 18 Apr 2025 17:29:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250418142958.6ews5uuoqayc7lof@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-5-wei.fang@nxp.com>
 <20250415204238.4e0634f8@kernel.org>
 <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Wed, Apr 16, 2025 at 05:16:15AM +0000, Wei Fang wrote:
> > -----Original Message-----
> > From: Jakub Kicinski <kuba@kernel.org>
> > Sent: 2025年4月16日 11:43
> > To: Wei Fang <wei.fang@nxp.com>
> > Cc: Claudiu Manoil <claudiu.manoil@nxp.com>; Vladimir Oltean
> > <vladimir.oltean@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>;
> > andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> > pabeni@redhat.com; christophe.leroy@csgroup.eu; netdev@vger.kernel.org;
> > linux-kernel@vger.kernel.org; imx@lists.linux.dev; linuxppc-dev@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for i.MX95
> > ENETC PF
> > 
> > On Fri, 11 Apr 2025 17:57:42 +0800 Wei Fang wrote:
> > >  	enetc4_pf_netdev_destroy(si);
> > >  	enetc4_pf_free(pf);
> > > +	destroy_workqueue(si->workqueue);
> > 
> > I think that you need to flush or cancel the work after unregistering
> > the netdev but before freeing it? The work may access netdev after its
> > freed.
> 
> Yes, you are right, I will improve it. thanks.

I think the workqueue creation needs to be handled in
enetc4_pf_netdev_create() somewhere in between alloc_etherdev_mqs() and
register_netdev(), so that the workqueue is available as soon as the
interface is registered, but also so that the workqueue teardown takes
places naturally where Jakub indicated.
