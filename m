Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4641BA77
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466905; cv=none; b=gaHoMAxwqbTqe8YCulYl5wddKlCW2Em/S8yHAaXrYoGTW+5YK3UQApxroqLJ3AS4e6o3JaZcZxvBpFniZXlsM8hZU6kQxfZkSVGufp7qwItNTFp+YEH2F/PA0tjz8gQdYCnG8F1m8MVwfpNqa5DXY+YucaweUY2TUt6k1gORArM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466905; c=relaxed/simple;
	bh=r+2I1mt5JUAQH2DibPBlj1jWA1g+boPLEamUKs/RTlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+na0Ii5+ZQIfTbjZn/Ua6VmGWLM4rgiacXDrPjRGHawmiJXS0M2l6fYuiRN+m+ki0sP8YmegL0/ND5AqaDo4DZNqgoy6BSEHUx5Q8lnjPR2JRcuCf6xXYAjFA/vlb1mPJfmoLQk2iXmYhwO1DCH8ssq6MZ2Z5UB+rdRBtDR21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IEfy15bP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IEfy15bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789466902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/ooFyjMzxLyQ/E6w/+gsTRY1i8Gt2eVZp+CjucjAlk=;
	b=IEfy15bPXYHpgb/D+fFi8GTHzrhL8Wq5WGKVlfZ+gS2ysAlX5sFBpl2u1o3h7uu5NQt147
	c8CdfGuHFOCJT7kuat+sLrCQVMkcLLwhP9dTRFC7mes2P0SGSWnSUrkB2qgAI6CG3cx/Vl
	c/HZ2GM2oqTQ/bl9CKRS230qQt3/ahg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-uGsHhrvJMZCQV6f6Aj4NuQ-1; Tue, 15 Sep 2026 06:08:18 -0400
X-MC-Unique: uGsHhrvJMZCQV6f6Aj4NuQ-1
X-Mimecast-MFC-AGG-ID: uGsHhrvJMZCQV6f6Aj4NuQ_1789466897
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486e8fb7d75so1427329f8f.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466897; x=1790071697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/ooFyjMzxLyQ/E6w/+gsTRY1i8Gt2eVZp+CjucjAlk=;
        b=xz3hGTlaH6Lm5PoWRmjdig3JwdYYOCVZkeT2tGp4DM+qtfaNyPogwZ3vVS5VHKeEN9
         sodV1Ya3LT46eprPZhzx3FCKUc5UqOUmVhEi7YSJa0+wUAYeh1KaiwHNDjhzWoFRg49/
         avgjZ0/JQFQPWk5yyfeDGbjWHg1WNaYKCHJa17HF/Kgns6w/i0yj0nmaqkUzYKKeUUAl
         0RchyDyiLQEr6HW9MdGUJ3kYoq24Pud+bseNjteytcv+K0Ndo6cTctQbCcwCKNCt6vTZ
         N/ouYpt1Gh9eu/vUFHIevZJI1RgumMjy6MCrKBJvAQUQ0lkToVXfcdJxw3Agyf+NXLTP
         0/Eg==
X-Forwarded-Encrypted: i=1; AKwUvByj0i+WhEGTOumo6GMe31RBw+Iralgf+8HIlBRP1mc1Y/hSvRGqXx3isS7rgPrMgplPB+Y=@lists.linux.dev
X-Gm-Message-State: AFuF++nC2Uu4U9qZOLO+ouwcmG7t1fGdFLkgnSQ4bun768tEcgVftDYj
	iBXqIWfb4MwMGz8vS5PkAXBzNCuigAWBfQ3RCeHyzHE+9FkpZm90EoZbOGXDgV6Ug5PrkUKjy7S
	hSgB6fQskQvZ0IkmBU3ZvUfIWFzH7FZkut0GAW/vsmYhFkyOkMGkLZg==
X-Gm-Gg: AYBFou3lfDJ1EwN//dMnbAGZvLnjBFzlrf2FtKqYyVXzoG+vtONiH10XxJ04eUahW/v
	wCAeqK1L5rl8uMdBE4XErQp5zuW/lDACPmLB0eODFblVM6b5dZGCnIqrj6SojgZoS87tLVt7O84
	vAYvqU6u6TGJ93KYaeiEILOP7HP3bfImvlpaopMC7alcccsouo026ybNxvPG1jmFVqF9y9lE8I+
	kN7WiBSfoU+6dwxBE+oDSjzkTe0F6bXTXZJ8nrVtaYv5jOCst+guk33w3WMfT4btAc4Qxzx4IrI
	Kk79x1apCepDtxYmlJDuAGMUm8Du6JEW9Ub/I3JBCVUg37kYIPpdRpQPzbzKufgjydty/YRj0Uu
	WhGsXAKIa4XTXeiyzb00A9+HHXoK7BuFnsYvwelh62yiYHd5oWOkaEZkCR9UvBpBHNqwIVZswaw
	==
X-Received: by 2002:a05:6000:41f1:b0:484:4880:449d with SMTP id ffacd0b85a97d-4870a951e92mr85719f8f.3.1789466896826;
        Tue, 15 Sep 2026 03:08:16 -0700 (PDT)
X-Received: by 2002:a05:6000:41f1:b0:484:4880:449d with SMTP id ffacd0b85a97d-4870a951e92mr85662f8f.3.1789466896304;
        Tue, 15 Sep 2026 03:08:16 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm35564685f8f.7.2026.09.15.03.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:08:15 -0700 (PDT)
Message-ID: <3eb68f01-a932-4a29-986b-b506ec6adb95@redhat.com>
Date: Tue, 15 Sep 2026 12:08:14 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 00/15] net: enetc: SR-IOV improvements and
 ENETC v4 VF support
To: wei.fang@oss.nxp.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux@armlinux.org.uk
Cc: wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hUbWLj9eKxfzxZjhBOuB6oB76MpSQrgSIL4B4MAIRFY_1789466897
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 12:07 PM, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> This series enhances SR-IOV support for ENETC v1 and adds VF support
> for ENETC v4. For ENETC v1, the trusted VF management and per-VF
> configuration query via ndo_get_vf_config() are added. For ENETC v4,
> preliminary VF support is introduced for i.MX94 and i.MX95 platforms.
> 
> On the PF side, the series introduces trust level management and MAC
> address assignment for VFs, and implements ndo_get_vf_config() so that
> userspace tools such as 'ip link show' can query the current per-VF
> configuration. The PSI-to-VSI messaging infrastructure is extended to
> handle link status and link speed queries from VFs, enabling DPDK-owned
> VFs to obtain accurate link information from the PF.
> 
> On the VF side, MAC address filtering is implemented via the VSI-to-PSI
> mailbox, supporting both unicast/multicast hash filters and promiscuous
> mode control. Since the ndo_set_rx_mode callback is invoked with BH
> disabled and is incompatible with the mailbox polling path,
> ndo_set_rx_mode_async is used instead. Link status notifications are also
> supported: the VF registers with the PF and receives PSI-to-VSI messages
> on every PF link transition, keeping the VF carrier state in sync without
> polling.
> 
> VF Function Level Reset is handled explicitly to restore the PF-managed
> MAC promiscuous policy after each reset, since the hardware default after
> FLR enables promiscuous mode regardless of the policy set by the PF
> driver.
> 
> Several preparatory refactors are included to share infrastructure
> between the PF and VF drivers, such as moving msg_task and mac_filter
> from struct enetc_pf into the common struct enetc_si.
Most of clashiko feedback is around the consequence of the 200ms latency
introduced by link state notification. Given your replies I understand is
a well understood compromise/design decision.

I think the better option is merge the series as-is and eventually
follow-up as need would arise.

/P

