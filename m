Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A21D516F
	for <imx@lists.linux.dev>; Mon, 10 Mar 2025 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637185; cv=none; b=CMjwoWsID50pxlDkXLfJoAT+gs/HzaiUxSOgKQsrb2Oxf1W+I60OUZQcyhCytxNyuyDB41HHOjPh4qwiNGaXplIsOqq5qeaFNbpWpyGa1tVysEjVu8pz27MmN7IfEkhqNdw5Dxfbd55eiCY+X3lk1Qcw7/t5bKVvKoYJkK7bQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637185; c=relaxed/simple;
	bh=81myXmDInhVPmhXO3slZMem7I5EfWSw4e3v9rXz9TEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqPFRC+T+aYDGy9tra8gGeKcChK7uxQGW3I+lNZO/nJCW2fVkvvsmuuXvw4pZKbsmrhr5CpBIvvJ8qDcKoggBFIfj4VTBoReoajH+o7eb/s6FnfXIEgkMQOJo+n4Bi7kasq3wyN7Y9Xeccn+CdFuF/ZHzJwpM1f9KdqSFeCflB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNqnqs7F; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNqnqs7F"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so9029525e9.1
        for <imx@lists.linux.dev>; Mon, 10 Mar 2025 13:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741637182; x=1742241982; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gD97NhLlEYL97V/2ZHq8YNEp8iOcNHwTCGab1mS8SQo=;
        b=iNqnqs7FjbtHaGqilv7U5BzMe4hlZdSXZFT59gAzfLVkzQcfwiM54E6yj3kN6VYJ9g
         n2WCmZ3Dp4o9GSzsmogRYI9/zNY6LZOMAJvyM9pCwib2x3/vqZ1g6n7NU5IMgLBtILW/
         CRVrtrP47+Wu41XRig+EhsDFtsMqBwkbxtFiMJDbUeHqkA3FkZrsAbkqOr3vlN9Vt5Qd
         DOLCm8iO439nuC9Lz5BKLbeztIe5tv2gBMeErZ5IyH6js56KEZASNazdIhL6fNcZQY6E
         N+2vYKh7zFyWTHofWx3tGu0vsgU8UOIJDJ+xP8RwJ5U7aqNArj2hESISxaDZavWVcSvK
         y4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637182; x=1742241982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gD97NhLlEYL97V/2ZHq8YNEp8iOcNHwTCGab1mS8SQo=;
        b=ZF96c3w34MGyOGW13kcd042PlWEJbvHzHWgNRWN7zNE2vf9rd2s1ZDQc0FnEJvz/dS
         1TuqPcM9W+DR8g45MA/579x/Z2/+QHUl3bDPfOAoZmtUUm+/F60rGP8zJFLHJMXLbGyq
         SEuIruoQOR4T2dUo7A1QqItp9Z8fjmTownx3EB3gYb2eeu2h4bOERGjU4vVf7diQKkSk
         0nenvfm/tCILjQdonQ6t4v7L+EJ3nZqesoV2sKsK+V63XDLrOE8V06v7yN9m4gUQGX5M
         k24+GhnjGbk7lMzMsi5BpI6qmcOX57Zj9XBFzlSmIK7doyH7fLftaYZYMIKkUADH02QX
         cljg==
X-Forwarded-Encrypted: i=1; AJvYcCUWfT+1IhAC/dZ/l01BUp9CT2e4dddZMF7bc0WDzxpIg5gaf7zheLomu9CPJStJJV22ieo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Z7+5oS05pB9d0wOxEvJRqr0kTJuOLwBXF22VaXax3UxyRdPV
	fmUR4lp1Xc6tyCOe6Ipg8b/SlUUXhOC2QAxsTcqujfbPSt3ZVvw9
X-Gm-Gg: ASbGncvLObAlkVdx5TtTIrD8Dba2C84jWra/dNkAJbUNcwSXJTcHkvJ3edpGuePR5tp
	jIQ0zhQDxeRFKlTYLarSX+oWE7XiStMHlrEEiiSnAvv3mtgl0JlsKJvpCpaD5yYe8iTV4pJ5o+A
	2ErXBa08kdwGAISTIziyPdgi0iqVYgH+ZsXfpgeHHYptOBJaBwPBPplLEoUNFj+Y/Qf0/yB3eQ0
	B23erWc44mYYzHKuS8MxXe0p5s4xP/vNtcpANylOk5VPUNZ5SQmM4z15M0E1UocprdTmy+z/G8H
	hauXf9ldrMGfUi+k8RMxoTE5xKMWF0nqHitbYwCixujExmg8dVPKaZviJsoT9bEFROZ+iSpJmQ=
	=
X-Google-Smtp-Source: AGHT+IGDtT3+hnE0yeEMt3/RuibcNDttpuQq96wWCddY+2VjI5dzRc+BpF7FBBIizcSJBbIrNO8ERA==
X-Received: by 2002:a5d:47c2:0:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-39279e5172emr1037350f8f.23.1741637181448;
        Mon, 10 Mar 2025 13:06:21 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0548sm160697355e9.6.2025.03.10.13.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 13:06:20 -0700 (PDT)
Message-ID: <4aef911d-d766-4ae7-951b-76843cf33c56@gmail.com>
Date: Mon, 10 Mar 2025 22:06:14 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
 <20250226212219.lthoofw7nrs3gtg6@pengutronix.de>
 <20250227112856.aylsurbt3uqm4ivw@pengutronix.de>
 <541539db-0015-41de-837f-aabbea68486a@gmail.com>
 <20250307143956.aft3xolakts3nlja@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250307143956.aft3xolakts3nlja@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/7/2025 4:39 PM, Marco Felsch wrote:
> On 25-03-05, Laurentiu Mihalcea wrote:
>> On 2/27/2025 1:28 PM, Marco Felsch wrote:
>>> Hi Laurentiu,
>>>
>>> On 25-02-26, Marco Felsch wrote:
>>>> Hi,
>>>>
>>>> On 25-02-26, Laurentiu Mihalcea wrote:
>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>>
>>>>> The AIPSTZ bridge offers some security-related configurations which can
>>>>> be used to restrict master access to certain peripherals on the bridge.
>>>>>
>>>>> Normally, this could be done from a secure environment such as ATF before
>>>>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>>>>> domain is powered off and then powered on. Because of this, it has to be
>>>>> configured each time the power domain is turned on and before any master
>>>>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>>>> My question still stands:
>>>>
>>>> Setting these bits requires very often that the core is running at EL3
>>>> (e.g. secure-monitor) which is not the case for Linux. Can you please
>>>> provide more information how Linux can set these bits?
>>> Sorry I didn't noticed your response:
>>>
>>> https://lore.kernel.org/all/a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com/
>>>
>>> If EL1 is allowed to set the security access configuration of the IP
>>> cores doesn't this mean that a backdoor can be opened? E.g. your
>>> secure-boot system configures one I2C IP core to be accessible only from
>>> secure-world S-EL1 (OP-TEE) and after the power-domain was power-cycled
>>> it's accessible from EL1 again. This doesn't seem right. Why should a
>>> user be able to limit the access permissions to an IP core to only be
>>> accessible from secure-world if the IP core is accessible from
>>> normal-world after the power-domain was power-cycled.
>>>
>>> Regards,
>>>   Marco
>> I'm no security expert so please feel free to correct me if I get
>> something wrong.
>>
>> This isn't about S/NS world. The bridge AC doesn't offer any
>> configurations for denying access to peripherals based on S/NS world.
> It does, please see the AIPSTZ_OPACR register definition. The imx-atf of
> sets OPACR registers to 0 (of course), which means that the S/NS is not
> checked _but_ it can be configured.

which bits are you referring to more precisely? because, from the OPACR
register definition we have:

1) TP (Trusted protect) - bit 0 => controls whether the peripheral allows
transactions from an untrusted master. A master is considered trusted if
MTR/MTW (from MPR registers) is set to 1 (MTR means trusted for read,
MTW means trusted for write)

2) WP (Write protect) - bit 1 => controls whether the peripherals allows
write transactions (i.e: is write protected or not)

3) SP (Supervisor protect) - bit 2 => controls whether the master needs
supervisor privilege or not to issue transactions to the peripheral. For
Cortex-A53 this refers to the execution level (EL0 - EL3). There's no S/NS
checks here. EL1-EL3 are supervisor accesses, EL0 is not.

4) BW (Buffer Writes) - bit 3 => some flow control configuration bit I'd assume


>
> Also please see chapter 4.7.6.1 Security Block:
>
> The AIPSTZ contains a security block that is connected to each
> off-platform peripheral. This block filters accesses based on
> write/read, non-secure, and supervisor signals.

yep, but this block is not configured by the AIPSTZ. AFAIK it's configured
by the CSU. So, as far as I understand it, the interaction is as follows:

basically you have the CSU which offers some security-related configurations
(see "Table 4-16 Security Levels" from the section you've mentioned). These
configurations are used by the AIPS bridges to filter transactions.

For example: assume you have peripheral X on AIPS5. The user configures
the CSU such that peripheral X should only accept R/W transactions from
privileged S world. Now, assume Cortex-A53 issues a transaction from
NS EL1 (Linux, for example). The bridge will receive the transaction and
check to see if it's privileged and S world. Since it's not then the transaction
will be aborted.

The AIPS bridge offers no S/NS world-related configuration options. All you can
do with it is:

1) Mark certain masters as "trusted" and block read/writes based on that (via MPR's
MTR/MTW and OPACR's TP)
2) Force transactions to user privilege (via MPR's MPL)
3) Make certain peripherals deny unprivileged transactions (via OPACR's SP)

>
>> AFAIK that's the job of the CSU (central security unit), which is a
>> different IP.
> Please see above.
>
>> Perhaps I shouldn't have used the term "trusted" as it might have
>> ended up creating more confusion? If so, please do let me know so I
>> can maybe add a comment about it in one of the commit messages. In
>> this context, "master X is trusted for read/writes" means "master X is
>> allowed to perform read/write transactions".
> No you didn't confused me but you triggered my interest :) and I started
> to check the (S)TRM.

glad to have picked your interest with this series!

>
>> Even if the bridge is configured to allow read/write transactions from
>> a master (i.e: master is marked as trusted for read/writes) that
>> wouldn't be very helpful.
> We're talking about the IP access permissions, right. If the
> "secure-I2C" is accessible from NS world this would make a difference of
> course.

It wouldn't though. No configuration in the AIPS bridge AC will make the I2C
accesible from NS world.

>
>> You'd still have to bypass the CSU configuration which as far as I
>> understand is also used by the bridge to deny access to peripherals
>> (e.g: if transaction is secure+privileged then forward to peripheral,
>> otherwise abort it). See the "4.7.6.1 Security Block" and "4.7.4 
>> Access Protections" chapters from the IMX8MP RM.
> I have read this too, also that the AIPSTZ can force the mode into
> user_mode regardless of the CSU settings, if I get this correct.
>
> What I don't understand as of now is the interaction of the AIPSTZ and
> the CSU. You can configure different bus-masters within the CSU to be
> S/NS as well as the pheripherals. Now the part which I don't understand
> right now: According the OPACx register description:
>
> x0xx SP0 — This peripheral does not require supervisor privilege level
>            for accesses.
> x1xx SP1 — This peripheral requires supervisor privilege level for
>            accesses. The master privilege level must indicate supervisor
> 	   via the hprot[1] access attribute, and the MPROTx[MPL] control
> 	   bit for the master must be set. If not, the access is
> 	   terminated with an error response and no peripheral access is
> 	   initiated on the IPS bus.
>
> The peripheral can be configured via the AIPSTZ as well. So which IP
> (CSU or AIPSTZ) override the other if the settings don't match, e.g. if
> CSU says: "this I2C controller for secure-world" and the AIPSTZ says:
> "this I2C is for non-secure-world".

the SP bit you've mentioned is used to deny unprivileged transactions.
The privilege is given by the execution level for CA53. EL0 transactions are
unprivileged, EL1-EL3 are privileged, but this can depend based on the type
of access. See Table 7-10 "Cortex-A53 MPCore mode and ARPROT and AWPROT
values" from ARM's Cortex-A53 MPCore Processor Technical Reference Manual
for details.

the bit has nothing to do with S/NS world so there's no overriding the
S/NS world-related policy given by the CSU.

>
>> Given all of this, I think the purpose of this IP's AC is to add some
>> extra, light, security features on top of the CSU.
> Or to override the CSU settings like the MPROTOx values:
>
> xxx0 MPL0 — Accesses from this master are forced to user-mode
>            (ips_supervisor_access is forced to zero) regardless of the
> 	   hprot[1] access attribute.
> xxx1 MPL1 — Accesses from this master are not forced to user-mode. The
>             hprot[1] access attribute is used directly to determine
> 	    ips_supervisor_access.
>
> Can you pleae elaborate a bit more how NXP designed the interaction
> between both the AIPSTZ and the CSU?

I believe this will override the privilege level of the transaction at the
bridge level. This could be useful if you want to, for instance, force
transactions for peripherals under AIPS5 to user but use HPROT[1]
(or the value you've configured via the CSU) for peripherals under AIPS4.
Not sure of an usecase in which you'd want that though.

anyways, hope my comments will shed a bit more light on this.
