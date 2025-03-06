Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024418732B
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741271413; cv=none; b=qWiKXvzi1L/Srz4GrxQuEgIupJ6HCqhczfvxQubGtpxTlzn3B9I0Nph0hi4EJkQk26XcXkG3l6fEpm6HErtt3PAxY4K2GteX8BECh1MGNQjmIiN4n6wxCADmi36oH9bxIOfpg/K7OhZLWQItYRvZHiCHL1yvRwWW+hBhpXAmQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741271413; c=relaxed/simple;
	bh=tdngADQvbAIOi7rpWve4EPmXndFqmD+MDTRj1HNgtAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMBDZiRhu5KhoYlrdQHTdnEz1VlOETdcAQoJQ58SBI+ExLCOsPky3po1AoNoyxnWgKrG7v5OYLAkzIVSCzeuZcTuKQ8FuXzDRO8+Q2zSePzyRJ2COCpU/Ka9pOsg6qftbD2VQH9kzxQtLhqm1McxjjWwHOUOT6i7nbqsTSYtRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XjBe8UUJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XjBe8UUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741271409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
	b=XjBe8UUJ8RqJvat1obarkYZqrO6JL3qGQD19sUSlw14DZubPyjrurYPzmCKFc26ab4PG1s
	Gop52hKu0ipLguSno/C9scWfkrck7PIi25qVgT646GsE+p/omON8UaY2kFOP2zznazvU7p
	8mmrEFqgLLCet/X8CKvq2ZA7P/GLtNc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-p6FsqSmsO8ejHZMlbsPfVQ-1; Thu, 06 Mar 2025 09:29:53 -0500
X-MC-Unique: p6FsqSmsO8ejHZMlbsPfVQ-1
X-Mimecast-MFC-AGG-ID: p6FsqSmsO8ejHZMlbsPfVQ_1741271392
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390e62ef5f6so295892f8f.2
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 06:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741271392; x=1741876192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
        b=Xo/c6n2Xo/dkfk0FVXIA7CuKa46WYrkAxxTCqb/B+uPTuG90DHRAaDdIPBOwmPmeHe
         cLDYNniA+C/kF14HeKivYXivQl/rYNdtoH154sMAlxCYolAag9XvV/0YKirjUydj3VV/
         06m3bLeHq/XSNrQ+k9ol1vJnAB7kc3B24nhCFDOl1phmpdmgRYQR5hxS5s/CHO+hbA/2
         Kraj6+FS+CNfWXDu9S3uqFOjbS1Ww3QFwejGt5E02epvAWs0vwJQSX6/+q/GZgu+mpKv
         QMCf9AU0HXQ8nGkFH7YAdCCta1rZxavxnI42pG98YmMDmyYQ0lJGKKBBd405Rgx+dhAp
         nsQg==
X-Forwarded-Encrypted: i=1; AJvYcCX++6gOxmd+/IFq73wiOrqGFuIoff6zLpAXc4HNyKVCgfhwt1bpneRbf1+G5Mkzh+gaBbk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRgXlnvvX9lSomU947wK/sna0JG+1fKsFAJRh82i6d49lZW/NW
	pqRasINH5ICoGhTRo29Jy8rJZ7lHMcIfrNQIoh8TIWIhFWCPVewWFCCuEcmTcOUaXRhm3sEy1Je
	Ouxp4YFjSrSFMjO6Zwb0bGzFDfIni+rU08+7lc5GrEI1ZDgWe7g==
X-Gm-Gg: ASbGncv4lsadgVuuNnxyHisGsOpIGuVNeym2cwUHb5rwNRuoZfkfGI/e+KDEAS102dq
	jRTe031rpiOAHYPta7wdSIDm5u74ZaWN22uRfhjEdKjYS2087P0y035Tiu/unllaBg+E1m7/KiZ
	qnGlhQtf/7KMYoX2BJtHhXQI5HcIcZ8BLDerZEa87kA4SxTByjh7eElhz7begZLZipYBLeImz24
	w/fOK8cIJcKBcAm+6ugXSZmNmwu/vNck8Sy4ZNjqGQHwFXtb8OvwZe7PhDI60fo/08Hledg7m91
	qrk+aloK2AJyqar0BlyzYPag1nU+TxlqxEExahs7weBPlg==
X-Received: by 2002:a5d:47c3:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-391300f7814mr755639f8f.18.1741271391555;
        Thu, 06 Mar 2025 06:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmNrvNwgj8JP10FUTkFjkayzhqglMLbK2EPOM2dy9cPE1fLkIBgeqVz0hx1d6bSuhoE5j+XQ==
X-Received: by 2002:a5d:47c3:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-391300f7814mr755608f8f.18.1741271391040;
        Thu, 06 Mar 2025 06:29:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c102e01sm2234126f8f.93.2025.03.06.06.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:29:50 -0800 (PST)
Message-ID: <03492277-b7e8-4cd1-b92e-699ee0d7dc85@redhat.com>
Date: Thu, 6 Mar 2025 15:29:49 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250304072201.1332603-1-wei.fang@nxp.com>
 <20250304072201.1332603-5-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250304072201.1332603-5-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mJoGKu0Kg-iBBG19K5YPaNI3cIZglFAJb1BoU5Gm_kc_1741271392
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/25 8:21 AM, Wei Fang wrote:
> +static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
> +					       struct enetc_mac_addr *mac,
> +					       int mac_cnt)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	int i;
> +
> +	for (i = 0; i < mac_cnt; i++) {
> +		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
> +		if (entry) {
> +			entry->si_bitmap &= ~si_bit;
> +			if (!entry->si_bitmap) {


Minor nit: here and elsewhere you could reduce the level of indentation
restructoring the code as:

		if (!entry)
			continue;

		entry->si_bitmap &= ~si_bit;
		if (entry->si_bitmap)
			continue;
/P

