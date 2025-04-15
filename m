Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF3D15ADB4
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724606; cv=none; b=RqjlcO2Fah6ec9FES3Ag0aubiMoaualu8XsKstYOkIJlVNIWPG4npStTgm47vyfIt47bg+u9qjBm5mjoB2QLtmGMecjUjy/xqShTZ6VHolaRIvlZn5guC1gxU4/bCkrLhZwnKTU70LmjibuYbsokCKfgjbWNEa8Kgr1HGbI3zPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724606; c=relaxed/simple;
	bh=Kr1AFDD5BTer6jIrOh1jS8j+MJa8b+J/by2OIVffdRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCCM8vpH/2rhYcIU8VE02P1AgYA1lhNMWiiGlBQVmfcGMFpOgDBm189c80pdCRWhMMuAzji7BiHXxD5O95kQBkDRgEIaKIzU5rqDO/SlDa/4SmyavF0M8ztZOlLPqJhdQS9spsWqNyq/gu+8ca/EZHpjHUteef3VRQHbzxF+iTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WMmzlYBS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WMmzlYBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744724602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
	b=WMmzlYBSrwZ+KRghqcR7jFTOQVKVT0sWPoRaAPu2AKaHmK/HJX5sJh86O122izMYDKVUVE
	RrrTvBmCaWRsJhMzQrk5RvngdVF9ggoIrv8iEabYe3YxyfPWV/7alR7PuFNMavcBjjnHbF
	lv+4WscPMl8viJVSj//zsDR9ZVxnSc8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-QrNOI3YyOyWaQLk_3kHGEQ-1; Tue, 15 Apr 2025 09:43:19 -0400
X-MC-Unique: QrNOI3YyOyWaQLk_3kHGEQ-1
X-Mimecast-MFC-AGG-ID: QrNOI3YyOyWaQLk_3kHGEQ_1744724598
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39d917b105bso3174953f8f.2
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 06:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724598; x=1745329398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
        b=OT+BEoIgIVhOAv98/SKoGlGW46WhRIArtIEyQnmyDMjV/JEqMtTGU2Zt9temjVzpHK
         YQscLCYZB+UrTcV4tI57JG37egtwGDen8FlyTq17i6KD6u1VbwI4aRxx5/8351CedTO0
         wKdF1C6+p80RIUFAFmvziX5Qw6TzjY0FIehvdo5xVmuc7fxBKQmER/12HuDwDeEDpp1Q
         82m9Dfr34La8VlR48ebmeb1XSxIb9M2dl2p8fLqfcr/FYhu1uoFl6UHQEJ9OfezUv/H5
         wbR71WCB/kaPavh+/r5FpigoGiYQkfmaIlsO4IWHYsc9Fy//rtBC5SmbelpVbPsMNVYB
         8i4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSEp+CZt7Bx8sheecPf/OWcgyNedsSL5H8tlrZaz6nGgTiuMSQYc9bDWEXXP9evdMwdnc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx17UAg4NU327ZSeplSgVtDtNMM5/n0JLqsZDy6zMRE7fciD7UH
	O4bpAI6r/EyeRybxlcMTmRaN53WyeHgFmyj5mB/yT8MJ/5fAgJ6cKUIOHpctUxJoEkKUxxVVtO3
	VSh1/YEuSyAk5SbkcJE0bYZsHAXh4vLm609PwSpUOFznEBBR9Mg==
X-Gm-Gg: ASbGncuQxVsN6ArQE1/LJHQxEKdGRgIHkqhAi1TuS5QM0iJ67uwNCz0KqbGC2TVmg4Z
	3j97Gn2k07jG0/B4Iz4pW3ycumyyaLlkVSkwgVaYeYi2JpyHnnBlj4tOHHs85VhNfC0J46p+mAL
	i6Qaj+uXqLrvCviSRzlR8ZI9NXX7A7A06NoQHRHHcgKWT+k3L9s8UDrgArIrmRFEmP9PeDe81Nt
	VopWNDcYY665rpxGPRpo7VT44DF+ZWFd0UeNK4AqP0gCKJxNaVNDh5VRl6WTCDOL6eKcJx3YxfX
	PfYzF3uuo+wgjjN9ZleBXQSdj0WjefUCQaGCfis=
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282370f8f.33.1744724597995;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0JyZk7iu1Ps9aWjZNEP8lEOiYdz+v1T/ibFseJb/dw7p9p9LOXvKaUssvdPPF8RDwWIrTgw==
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282344f8f.33.1744724597586;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c02esm14065754f8f.23.2025.04.15.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Message-ID: <4ffd3630-bc75-47db-b63c-3dcb7af8249c@redhat.com>
Date: Tue, 15 Apr 2025 15:43:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table()
 hooks to enetc_si_ops
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-7-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250411095752.3072696-7-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bSbXvY6jZ7cumrcTsnfHmGracABPEJZmqlaaTHfBF-I_1744724598
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 11:57 AM, Wei Fang wrote:
> Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
> different from LS1028A ENETC (v1). In order to reuse some functions
> related to the RSS table, so add .get_rss_table() and .set_rss_table()
> hooks to enetc_si_ops.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> v5 changes:
> Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in both
> enetc v1 and v4 drivers

Note for the reviewers: this changelog actually applies to the next
(07/14) patch.

/P

