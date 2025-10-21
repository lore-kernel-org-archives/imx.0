Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261725D540
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030886; cv=none; b=K1SUyDHFwarcrCGaCaYLl3x2frvs2SKUZH9wP0gXffoIAPenppr/kQjny02GdI5xxcWON/IiwkcIbscOci2JGimySmED2hGYtkfl0n1TVGCiNldNvO2OY3duN/DRCB1vZp/hwfRmXInwWAspkjLafx080xxUFo9DFU0Ys+wAuuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030886; c=relaxed/simple;
	bh=+B2pxE/i3SpbGCZgmKAbV6E4BQeWooWjeCR64E75cc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCBY6/WAWqk3G59Plg4/578RdJFIZF70q0Z4h5ihWeoe5X0faDoKdJ9TOZuIV5khpvYNy8rS1hXPxrEuqxWlaRiauZJhRDiQ3ncwLT20cMc40kc9APMYsigXhCIhhlCMnITd8s4R40Z2dMhJEFMYgayKZMYT329/vS7u5/BsfK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dlqOc8So; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlqOc8So"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761030884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3VpVCv3g+Sg2rw7HqhbXAeRhRk3VZinAbv22WqGX9s=;
	b=dlqOc8SoLM3BjFwxx+1Uopefp5Xa7IEDlYE07gOB+H3+SM1dmi1Pi2uE2m+JDjExGJjb71
	hYTYjR7+0ayCDfW3PbjCnCcN0o9YLNry2HmklKaIZK1XPYOIG940tMJZ2UCMqDFHFjq2Pb
	c8khxafkDJ1v+FyvRXXXEFihEW4um68=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-Q16-hFlaNJ68roeRchq7Lg-1; Tue, 21 Oct 2025 03:14:42 -0400
X-MC-Unique: Q16-hFlaNJ68roeRchq7Lg-1
X-Mimecast-MFC-AGG-ID: Q16-hFlaNJ68roeRchq7Lg_1761030881
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so28293535e9.2
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 00:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761030881; x=1761635681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3VpVCv3g+Sg2rw7HqhbXAeRhRk3VZinAbv22WqGX9s=;
        b=Ib/kF2zaH7WLjLJg6M9bfsJsk6D/vORGmQoRGGFCWr9Cr6ER+b3bNodUd/JaZ0q5h4
         pirdr/bmoLgFHMNzawnxg/u1C4kL5E7YBEa+Ax1eItfLJ9UxwWQFVjbIyRLICct6kHM/
         YLTznP/abVRHhjAEAhvP5PmTKWrgjn0EgQ50z+C2cZsO8iPw52o9I2kIdtIZkpGlbU8d
         h51PpZ9g7JHzr9prX70Qe7SYMtzmknUzQckqrqzL3ZUz67MucJqCfAmx/EchV7kbzwb+
         bjlDOb5Sg0GBjuG5b5WuR+/zrXanAdX1fsgaddJhv+UTpCI0tL4agMrAUhEgTQbU0qUN
         RGJg==
X-Gm-Message-State: AOJu0Yyt15NG38tRYhYdj2oZdulZqn63vj9E+bFl1hKLW36F1t6K+PPJ
	Pe6gg9ZVxyTKv3JlVB2y/NcukwVltWAjDwmG4efLmsSHCGjAEED0sq5TxwB0hVEj3XLRQH9kPG3
	qQmsme+/xvJ8BaesgDC4HumzB8WcF9WjPJxuXIGyD9RJw9fneXS+RxA==
X-Gm-Gg: ASbGncufdtxzECzHNaXGyLVFrw5vQu9dBfV7KWNlZUcK3Ftc6YUGD0VnZQ5ch1UP9Su
	yuANIZ/lbDbt3Kaxi81hOHk/GHDzxbHHVuCrjvBjqpBTpBQ0yEO68eb7OCHxweA/Dhzf7SIAaPz
	tfArSqvZOBRHb6CXtrHF802mEnF492gomy5qBPLKB+QHQpfHY6KEY1erd/IfEEOmAULyaiB6iW5
	GJMd+FjQU2lqry/AFt0kcq+9FONAXcnfQ00Vs9d8Vc5KTF+N8EUgI9XnMqHxGNxvvczL/BifY9q
	N/PVu0keHmDCX7rmOku/vmyjztydjz4ogfAojxB1bwKsMUzfK26+4lbvmunKTcf9ZmtMMLE3vJ0
	bBIFNY4FeqWGi6olJ3u66YS0MRc4dKz5w5kKn0iLZiJUHXvI=
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4711791fbbbmr122888725e9.33.1761030881119;
        Tue, 21 Oct 2025 00:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAbONMD+QOMnDrNKO8RV6QYb7ZpSXAEjBfkQuhDaa4d7qoOlbgykLKNXPsi+4U3b+ujGw+cQ==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4711791fbbbmr122888225e9.33.1761030880241;
        Tue, 21 Oct 2025 00:14:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9f9dsm18907741f8f.39.2025.10.21.00.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:14:39 -0700 (PDT)
Message-ID: <be03d7a5-8839-4c84-9e16-b96e52f6983a@redhat.com>
Date: Tue, 21 Oct 2025 09:14:37 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: enetc: Add i.MX94 ENETC support
To: Wei Fang <wei.fang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, Frank.Li@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 richardcochran@gmail.com
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251016102020.3218579-1-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251016102020.3218579-1-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ng4jKuBLvufpV-CLwMq7ztg93PaW79CM-6lW9zRBOec_1761030881
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/25 12:20 PM, Wei Fang wrote:
> i.MX94 NETC has two kinds of ENETCs, one is the same as i.MX95, which
> can be used as a standalone network port. The other one is an internal
> ENETC, it connects to the CPU port of NETC switch through the pseudo
> MAC. Also, i.MX94 have multiple PTP Timers, which is different from
> i.MX95. Any PTP Timer can be bound to a specified standalone ENETC by
> the IERB ETBCR registers. Currently, this patch only add ENETC support
> and Timer support for i.MX94. The switch will be added by a separate
> patch set.
> 
> ---
> Note that the DTS patch (patch 8/8) is just for referenece, it will be
> removed from this patch set when the dt-bindings patches have been
> reviewed. It will be sent for review by another thread in the future.

Note that such patch is (AFAICS) breaking Robert's tests. Including it
in this series will possibly/likely prevent (or at least slow down) acks
on the initial dst patches. I suggest omitting such patch in the next
iteration.

Thanks,

Paolo

