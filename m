Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA133FE
	for <imx@lists.linux.dev>; Fri,  7 Oct 2022 21:25:58 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id l27so3578697qtv.4
        for <imx@lists.linux.dev>; Fri, 07 Oct 2022 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pp3PkNdpP6jrpj+2aY9vM5YFVJap6BN+ylh/P+ZmqCQ=;
        b=BwwO755p9NGTK+jw/Jm945MjRSatJXV3PX9Bpt7qwsN70+f2/XXunJJXibUP5l9rp7
         JqP3icDS19X6tdwddnJYvYMh0RXb5feHt50Fe5C5l+nsbiGo20HwjErZoWldsXv1bjYc
         ZTwPtWBD4MkjPLYXSzbSCfSkoMndRUzjCV62nKy2HFNvczouML9SQgLCDm1fX6c8mPEu
         w0AuaRC7KiisOCQotAk0rn+zJxm3ttBA/CdnycyimTkiAmiLyIooZIeDDCxHWZXuk6+C
         DcHnfMCrHdosqEp3Ao+hqKkHvFfCDvYfh+yA5HKyjG76oa8julyR1UENtFgBph1CSmez
         RWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pp3PkNdpP6jrpj+2aY9vM5YFVJap6BN+ylh/P+ZmqCQ=;
        b=tv2mthu4id2f4DRBSiN8KaXqB+wHNuAQcqh/Gqmrx81cXF5wpZAwmci+RerOpWTpHT
         1eQgSXzL6FNCGVPhLTn3e7u5fXulSPoKFjlmN4uT7tHdYFAQw81BrzkS5iPpy64XHyfW
         cbgEtTwW119z+I0i7OdJh88XW9kNxYtGqa4BBSthSM/a0H9XLCCW48EGUqUPg/IAwccS
         moyu2NrEecp1gcxz3GVJnrLfyOw05/CQJhyKy6YdqRmWtOwEVfBeWSVSKNIGERQYReXL
         tKkJDF8ny56PM+JvEaemC2vHqv/ySKLoRfnyQYvRc1Ri92idOqeTORlzG1z/f6AI9mrk
         ULvg==
X-Gm-Message-State: ACrzQf2YG95/AdPN4F0fvQvTANB4PeeFo7Or+vdC49Iz8d92z9ooCpMW
	lA8hF0Fs+wnaAWsRXBgTk6g=
X-Google-Smtp-Source: AMsMyM4IVyQL8e1ldgW7ejKvXkivsbYmt0BIXTluu0teimSk6wCTBzk23s9DK5Qw6kAThT9W52E3Dg==
X-Received: by 2002:a05:622a:390:b0:35d:44ab:c615 with SMTP id j16-20020a05622a039000b0035d44abc615mr6064206qtx.594.1665177957035;
        Fri, 07 Oct 2022 14:25:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id ey23-20020a05622a4c1700b0035cf31005e2sm2897179qtb.73.2022.10.07.14.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 14:25:56 -0700 (PDT)
Message-ID: <3a95403f-0f26-6f64-1cd6-7770808f8514@gmail.com>
Date: Fri, 7 Oct 2022 14:25:51 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] net: phylink: add phylink_set_mac_pm() helper
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, Russell King
 <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev
References: <20221007154246.838404-1-shenwei.wang@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221007154246.838404-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/22 08:42, Shenwei Wang wrote:
> The recent commit
> 
> 'commit 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'
> 
> requires the MAC driver explicitly tell the phy driver who is
> managing the PM, otherwise you will see warning during resume
> stage.
> 
> Add a helper to let the MAC driver has a way to tell the PHY
> driver it will manage the PM.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

This is fine and needed, but first net-next tree is currently closed, 
and second, you need to submit the user of that helper function in the 
same patch series.
-- 
Florian
