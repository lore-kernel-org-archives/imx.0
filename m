Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93817475
	for <imx@lists.linux.dev>; Fri, 17 Mar 2023 17:47:24 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t9so6452495qtx.8
        for <imx@lists.linux.dev>; Fri, 17 Mar 2023 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679075243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkpnQ8pjRqI+McI410V8kcv0tcTp5sXulpV3DbQRNsI=;
        b=fNL8tRSCHssQd/8QA5Z42BAkK6bbnVSbHT0oHbmSGFFuAFI1YDLLBDJyChAp2DHCtU
         9clE420dHbGEb5crxhaiMs+2AksnYEr/l8peOj8QqgIEgvRQudrzhkWDyMAbPq4xS1aV
         bG3ENhQ7trynAs3ic2evha+J4a1RZEj+GT9wtEEPIY1OH9PR4kGCtUPSvsqEqhQZFMrJ
         EGXt2a9cwlI8VEIyymOO+j0QNyBwXGKzkcwA4+RgJHQTy6/oRiX2m0R/ONJWc9irG35Q
         S3l1j+OBlYEiEOa5D06QlUUQuUlq3dDaBQHoN/ci9pjHcfMYIGtkI94TNchkBCvFg80q
         1BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679075243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkpnQ8pjRqI+McI410V8kcv0tcTp5sXulpV3DbQRNsI=;
        b=QFUpyKJ4pTGf80rmOMHa9Uj+/btHQb5I1OrSpoxorsU1u8q0SjP4EmeUbNxEnZFq50
         KllOOfJq7yBBbDQZppro+lZY0WShQC2/qCvwyUn8onZtyzOpCqzEFXRpatML14gFk80w
         F7M3XgCsuIruOv/8KQ3exv3BWii/F624H9kOZaVL8Jtt4xGFgHT5MkZrm81qsq2hfYi0
         q3I4SGjrxVtkqAvPMeFFSxpGMIr5kMKLPMFSWEX77G+U8Sgp4BrqL7ewzUZZGs0Y/+9l
         mQYuuhT0nRI/KshK9d2J0STLEggzgxhjzTo1bYku564mNcihQsaQrbmhnRispavUBWeM
         p8EQ==
X-Gm-Message-State: AO0yUKUvUwHh1NnFP4MjGm5WnEWmH1MX2Q5ZPbQMaZPFO5P3CHqGoHPc
	JXVSRy59xREyXEMFGkg1geE=
X-Google-Smtp-Source: AK7set/IxjvxjVkJ2Zar1BFwcYo42229feu5dmIbHrAaNNVxrE4sG4PviIBMDXIMvFr+LUX3kpgM6g==
X-Received: by 2002:a05:622a:144c:b0:3b8:68ef:d538 with SMTP id v12-20020a05622a144c00b003b868efd538mr11032069qtx.52.1679075243636;
        Fri, 17 Mar 2023 10:47:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id j68-20020a37b947000000b0074577e835f2sm2078168qkf.48.2023.03.17.10.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 10:47:23 -0700 (PDT)
Message-ID: <8985802d-1faa-abd3-0188-49d73fed7a09@gmail.com>
Date: Fri, 17 Mar 2023 10:47:14 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] net: stmmac: start PHY early in __stmmac_open
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20230316205449.1659395-1-shenwei.wang@nxp.com>
 <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
 <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/17/23 10:34, Andrew Lunn wrote:
>> NAK. A patch similar to this has already been sent.
>>
>> The problem with just moving this is that phylink can call the
>> mac_link_up() method *before* phylink_start() has returned - and as
>> this driver has not completed the setup, it doesn't expect the link
>> to come up at that point.
>>
>> There are several issues with this driver wanting the PHY clock early,
>> and there have been two people working on addressing this previously,
>> proposing two different changes to phylink.
>>
>> I sent them away to talk to each other and come back with a unified
>> solution. Shock horror, they never came back.
>>
>> Now we seem to be starting again from the beginning.
>>
>> stmmac folk really need to get a handle on this so reviewers are not
>> having to NAK similar patches time and time again, resulting in the
>> problem not being solved.
> 
> And just adding to that, Developers should also get into the habit of
> searching to see if somebody has already tried and failed to solve the
> problem.
> 
> “Those Who Do Not Learn History Are Doomed To Repeat It.”
> 
> Try avoiding wasting everybody's times by learning a bit of history.

This is a tough problem to solve though, we have had similar issues in 
the past with the GENET driver whereby we need the PHY clock in order to 
clock certain parts of the MAC's receive path to ensure it completes its 
reset. This is a terrible design that unfortunately a lot of designers 
get wrong.

Eventually we found that we had this "auto-configure" feature which 
could kick in when the PHY is up and running which solved it:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=88f6c8bf1aaed5039923fb4c701cab4d42176275

though it took a few attempts to get there:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=612eb1c3b9e504de24136c947ed7c07bc342f3aa

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3a55402c93877d291b0a612d25edb03d1b4b93ac

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=28c2d1a7a0bf

Does something similar exit on stmmac? Can you somehow utilize the MAC's 
TX clock and loop it back to the RX clock to satisfy any clocking 
requirements?
-- 
Florian

