Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1004405
	for <imx@lists.linux.dev>; Thu, 18 Aug 2022 12:54:09 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-10edfa2d57dso1692608fac.0
        for <imx@lists.linux.dev>; Thu, 18 Aug 2022 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=BpcQ/42eoOLXIZkpM1l4Ekjxv/B7Xx84lzxtsmJojlg=;
        b=hTSkYVhvoWd0YIC3H868SCXjPn4G39w3ZXxNJ/tWcanSV3jaaYnJgFCJG1OdXwzeny
         uElZpsMPpXhrvmx8YpI+e6z+npPEjcwkTkt7mKPVfI7wqG9Y2+uvs6JYcXQs2Ktp6TnQ
         /QeT72YbD3ie75WmIdl/rNRxnOG1rfmt3EiZASCe5NlfILWP2g0LUXnCJRoRan63IB8Z
         TdK2kCh2G69I+I1Ly93HfvA2iw0rhk+DT7fxMBpX8nZ0oGXOF0r9UY8wPBieqNNJXjOe
         OCf6KiOUlkEgA+x3NaQhnUUsSmHNf5Dnx6XDWbSZKlkDMejm6RAQqRIsOttjEFMy7iq1
         NMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=BpcQ/42eoOLXIZkpM1l4Ekjxv/B7Xx84lzxtsmJojlg=;
        b=Rjgq0ud1qhDiZRQ5bEd56xGLBs08cGsdKUmkts2uNYKv6aVpRyMOUfxJPSyD56gL1D
         p+Zb9V4xn54Yre54axw4vHbB8ASkS0XsgubjsBcw6+72ZeUNpj8b0r4i8Fmffa0NUAc7
         1Tk6hykXpXOatEcR6HFqBnkI83Wmf1kyOs8m6EY7sSd4DMRDxmj/sSCFe+xmGzQVEPCf
         6tj5V7u1gMAgOrLlHtKoHMZAZzA0b79XAfO3rw5WKGEK3p7ZXQrydAHZAJ6j4qfg7JRu
         SgswdZz1ixDHNUkK9gLqJtpHnCoNHzGmSK//GrBTKO4WXYVmbUkt/JilYCCc7cfZTgzy
         /IGw==
X-Gm-Message-State: ACgBeo2SM6TXnRvkHWxgBP4Qu68hIi3N37PBN7I5b2qeUsjSJKb6bZsu
	QsCbn23HCw+WDcHn+cyDuWM=
X-Google-Smtp-Source: AA6agR5G+DGYLdTfaZVBo0n9tPYeIKUUEM62QrxNrzVwM5x1wUKrVBoXWbMaY/FE4Fk5/1rf/e11/Q==
X-Received: by 2002:a05:6870:c0ca:b0:118:8dc9:90f9 with SMTP id e10-20020a056870c0ca00b001188dc990f9mr1228603oad.161.1660827248672;
        Thu, 18 Aug 2022 05:54:08 -0700 (PDT)
Received: from ubuntu ([165.225.217.40])
        by smtp.gmail.com with ESMTPSA id 4-20020a9d0284000000b00638ae0350bdsm399311otl.0.2022.08.18.05.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 05:54:07 -0700 (PDT)
Date: Thu, 18 Aug 2022 07:54:04 -0500
From: David Wolfson <wolfson.sol@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] I2C_IMX support for i.MX8MP
Message-ID: <20220818125404.GA45792@ubuntu>
References: <YvzFPR5rwVSLzNPK@skidata.com>
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yvz2IA9GB2NJmc+D@skidata.com>
 <DB9PR04MB82843B074F7F2ADB0D455867896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yv37CrPtlm0WSUmd@skidata.com>
 <AM9PR04MB827430FBD894470753E97BC5896D9@AM9PR04MB8274.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <AM9PR04MB827430FBD894470753E97BC5896D9@AM9PR04MB8274.eurprd04.prod.outlook.com>

On Thu, Aug 18, 2022 at 11:59:41AM +0000, Shenwei Wang wrote:
>Hi Richard,
>
>Nothing is hidden here. That is PAD control register, and should be documented in the IOMUXC and PIN Control section in the RM.
>

Checking the IOMUX and PADs' settings is the first step when enabling
an interface.

David

>Regards,
>Shenwei
>
>> -----Original Message-----
>> From: Richard Leitner <richard.leitner@linux.dev>
>> Sent: Thursday, August 18, 2022 3:41 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>
>> Cc: imx@lists.linux.dev
>> Subject: Re: [EXT] I2C_IMX support for i.MX8MP
>>
>> Caution: EXT Email
>>
>> On Wed, Aug 17, 2022 at 02:14:53PM +0000, Shenwei Wang wrote:
>> >
>> > The support for imx8mp-evk board has already pushed to mainline. That
>> includes the usage of i2c-imx.
>> > For example, a GPIO expander is connected to I2C3 on evk board.
>>
>> Thanks again. It now works with linux v6.0-rc1.
>>
>> The missing piece was setting the 0x40000000 bit in the SW_PAD_CTL registers
>> of SCL and SDA.
>> Unfortunately this bit seems to be undocumented in the RefManual and also the
>> driver documentation doesn't state anything about it.
>>
>> Can you please shed some light in this "magic" bit? Would be really helpful,
>> thanks!
>>
>> Furthermore I guess documenting it somewhere in the driver or setting it
>> implicitely (if that's possible) would be a good idea?
>>
>> regards;rl
