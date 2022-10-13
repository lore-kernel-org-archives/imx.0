Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962B4416
	for <imx@lists.linux.dev>; Thu, 13 Oct 2022 18:48:03 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h24so1963457qta.7
        for <imx@lists.linux.dev>; Thu, 13 Oct 2022 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hh8VSPpCMU9TIR5sHV9wcae/102Ucbb59hlSDBbz5K0=;
        b=jTpqb6zkVQ4xqk9gOWmU9z54LGeG7Qjn3ItnfydnvulihLlcuPeSEWmoivT+l9KQ8N
         KTF9k46oi+jJkFSYtiIrdRWdWwbYc5w5lj9HOI4LKFbB5mL+KTzeOvA5Oj1qsD8GEIv8
         rqZzSALPiyy7BMHRY5aS5crLMMfcAUaRRtXNJo3CcbybGra1OAZq6vGD9vMsRLvjTHcv
         6EUVhMDNaXQzNraQa5xJxDWZjtcBxHER7EA9OzQBqK2s43+Lo5dO0cO5h22QLCFJ0dWi
         5y9AKHe3VsWY1MXbhWpfq8FpZ6/8Lg9Mc1x623wLRAmEa9adgvDvnkxfDwcMBTw7Jsxt
         Jzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hh8VSPpCMU9TIR5sHV9wcae/102Ucbb59hlSDBbz5K0=;
        b=l382MSPbi6BRvoY2Tc78mRiuEnpGDGxtdCdSdLuJ7oDMsVBGKTNui6oWPjn8pEZfVq
         7A6reSkkJqi0pkG6H0I2bAnwa01m+hnVbdYOV+Us4X7LOU5bqrcPBRkU1yNQpSeVVHkp
         x9WO0YItUgRAweS96d+JDczdNKIk48rVpu6E+j5VmTWt1DF72fEE2cET2Olx2+2P576S
         mAM96llCtcYKWRalpNct3OD2UJRNYFbdcgNMyX6bnVDkLx9vkH7j1BUV7njBE38jhCmh
         LzP1lRpp2T7YVmPd+rSP2TchCGOzGAD6xu2GF6Dca66Bhwj7dvFsL1qSYqNk3q9uck2l
         JXgA==
X-Gm-Message-State: ACrzQf08D3tEneY5FoqIMx/sc6adZbj3fTlCTA+V5XcbnX0mrjdXITiK
	4mW1CRCONBf6A3+9VQlIiCM=
X-Google-Smtp-Source: AMsMyM7FqhQ83abcQwq5mIJuWc2u/CV0q4+UWl5+zr+whM9PEeb41Ff7MvU48hn8K17v6H0ubYn0Bg==
X-Received: by 2002:ac8:4d5b:0:b0:39c:b6d2:b631 with SMTP id x27-20020ac84d5b000000b0039cb6d2b631mr1078235qtv.487.1665686882814;
        Thu, 13 Oct 2022 11:48:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id l3-20020ac84583000000b003986fc4d9fdsm497159qtn.49.2022.10.13.11.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 11:48:02 -0700 (PDT)
Message-ID: <2c861748-b881-f464-abd1-1a1588e2a330@gmail.com>
Date: Thu, 13 Oct 2022 11:47:55 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/2] net: phylink: add mac_managed_pm in phylink_config
 structure
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Russell King <rmk+kernel@armlinux.org.uk>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
 <20221013133904.978802-2-shenwei.wang@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221013133904.978802-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/22 06:39, Shenwei Wang wrote:
> The recent commit
> 
> 'commit 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'
> 
> requires the MAC driver explicitly tell the phy driver who is
> managing the PM, otherwise you will see warning during resume
> stage.
> 
> Add a boolean property in the phylink_config structure so that
> the MAC driver can use it to tell the PHY driver if it wants to
> manage the PM.
> 
> 'Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'

This is not the way to provide a Fixse tag, it should simply be:

Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect 
mdio_bus_phy_resume() state"

With that fixed:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

as a courtesy, you could CC the author of the patch you are fixing BTW
-- 
Florian
