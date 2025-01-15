Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718151E98FC
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937582; cv=none; b=E+Q/BGceF0mibalBO7o7DVyXUgsNcAw4TOz/u5F4oPtmRdUd2llufjZxXWPXTSqlTP208aoVE2oHlcUo1rTdO2YxPYPaCyeu1Q3yNWPMEtdkS/1bD0Gq/lOFBmX9hCp7eiKSOO2Ln9saLh0oHwTtXQKmcOnwDa9OQzpA0K98DNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937582; c=relaxed/simple;
	bh=X8Bzq4vbc2nIS7e60WCciDuogVSuL4jGVmJ+gTlQLBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFw5obYcWcEN0vlDhQxJ2J+gQI3G86TYBY9djAG+aP45bGYanFd5fY5WGuIGl28nnajdNi5YSpW0C54QZOHuQxc9/0CHsqX6/YUuciRJWd6Elvm6DBTE8flznnQUAMAWNSkpMPqbLQRWkVyycjjnhDMqlbEFWm3O8s07aexqkog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD68DaYC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD68DaYC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43626213fffso3977845e9.1
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 02:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736937570; x=1737542370; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dMGwxkrNU4EuX7kCK3KWCsT3+R0q8TNNOAL9QCORoDs=;
        b=BD68DaYCB3+2z7S5qlKkPRooM8adQywJvsRmcNTr7WjCSOBrwjip9F7UaWTb75PUog
         D7HNmw6ccPtgIstG+lhOMtTD4dPe1M7kXMEWLo/EUopq0pentC9n5pSCUO/6zk2AbVIl
         zSUjh0+kBNLeNkBnPSLwWgUWIPFQRuS8JLuvWAuJnzsy0WmNU82SQIUVEQYlnuF7p5pR
         XG5jTjue2GwAyDuTVydSDm2GUP5U0s57oKsMekDBuz0QVPUduhBjjv0+dJm3c1YGVXa2
         6UL8iKJ0g4j1PMSZCPUEwirIBPH8ldLvthDYsKxmIboDTAZWw+Gho8JaVQAvwnsovjG4
         sIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937570; x=1737542370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMGwxkrNU4EuX7kCK3KWCsT3+R0q8TNNOAL9QCORoDs=;
        b=dvlZmgQrn6Zkijfq35oNWGqGHBC+AJlnYF3075nLQ2wgtxuYCrVU9qVVPUvAI6VHhz
         wnK9Z76P4rfFG2xxzNAa06wa+MYa1AhTQ4/1r0lFd86KyGX492mYA3XNQRR6lyB1rW6K
         wp3rmY+tMWZ2mMyuawJj7cl0Ncvt2fdkP3x7mkncInSU/Vbr/49AZAUrstUNEMvcDX7/
         2+SY6BNA2CvnWITIRDzxc3+Tq+WdzqJm0FW4YAWZ827lyX0Z4gXkt0p3KyJXelm+Gclv
         JrFH4wTe0FeVNOmeAAmz6eiH1a3jwqdMguhIP9ddb6PlU+U2d1QUNWd1x1o5Kxpaw79s
         xX6w==
X-Forwarded-Encrypted: i=1; AJvYcCVUeTpAgYMwZ9HHTktUkTgDekb7TQM2dhFPxOmHGs4Mb2WDAjT80daedCoSIED1pdk3320=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZS921TYP6CNIWqszy29Hlnh73OJ2crUFhZtfFwnZgxi1/3a/W
	ok1m0Kh6RgbPurbL+rDhUz0wIodmqPLw0lcg3Tt2sDl8vRzgvWvQ
X-Gm-Gg: ASbGncsahxc544XJMAxyb3Qkfum0bsUF6cCX2uu8wiVPNBgruLwD1g5ScYQEoR3oBZT
	0iOBXLYIsggdNVFODM0GBoUbpWAQj+wfAAULKhjCDq8ibYcRAmsa8FTsBnPsfeFlSwszwxkwGDC
	fylC3OOmqwRlfKN6bYNap+c7AM+crRBxus406DAb/LKnfF0H8CvoNcmekNf64Q31RF6t+QQYNvo
	0LaBH+EsyFIHWzkKOFiH8BGg9PTZbn8jqJtREWfhLgUOWesB6in/fDo6lElkrwl6q2mCJ67boDE
	NtbKnsCj
X-Google-Smtp-Source: AGHT+IHOFTU9f4+9ieGESD+g8VrC92IkwfrseF/N43WFilUY2QDiHeaeuJlBZap4xY1mATLjrY8KLg==
X-Received: by 2002:a05:6000:2c1:b0:386:374b:e8bc with SMTP id ffacd0b85a97d-38a8b0d3425mr21291410f8f.15.1736937570162;
        Wed, 15 Jan 2025 02:39:30 -0800 (PST)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e5e69sm18287335e9.37.2025.01.15.02.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:39:29 -0800 (PST)
Date: Wed, 15 Jan 2025 11:39:27 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Message-ID: <Z4eQX_VnBEVqxT_r@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop>
 <Z4dy3LiEAQ_gkQGG@eichest-laptop>
 <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>

On Wed, Jan 15, 2025 at 05:14:09PM +0800, Shengjiu Wang wrote:
> On Wed, Jan 15, 2025 at 4:33 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > Hi Shengjiu Wang,
> >
> > On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> > > Hi Shengjiu Wang,
> > >
> > > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > > On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > >
> > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > >
> > > > > Currently, the flags for the ACM clocks are set to 0. This configuration
> > > > > causes the fsl-sai audio driver to fail when attempting to set the
> > > > > sysclk, returning an EINVAL error. The following error messages
> > > > > highlight the issue:
> > > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > > >
> > > > The reason for this error is that the current clock parent can't
> > > > support the rate
> > > > you require (I think you want 11289600).
> > > >
> > > > We can configure the dts to provide such source, for example:
> > > >
> > > >  &sai5 {
> > > > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > > > +                       <&sai5_lpcg 0>;
> > > > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > > > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > > > +                                <722534400>, <45158400>, <11289600>,
> > > > +                               <49152000>;
> > > >         status = "okay";
> > > >  };
> > > >
> > > > Then your case should work.
> > > >
> > > > >
> > > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> > > >
> > > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> > > > the driver don't get an error from clk_set_rate().
> > >
> > > Thanks for the proposal, I will try it out tomorrow. Isn't this a
> > > problem if other SAIs use the same clock source but with different
> > > rates?
> > >
> > > If we have to define fixed rates in the DTS or else the clock driver
> > > will return an error, isn't that a problem? Maybe I should change the
> > > sai driver so that it ignores the failure and just takes the rate
> > > configured? In the end audio works, even if it can't set the requested
> > > rate.
> >
> > The following clock tree change would allow the driver to work
> > in our scenario:
> > &sai5 {
> >         assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> >                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
> >         assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> >         assigned-clock-rates = <0>, <11289600>;
> > };
> 
> In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kHz),
> PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
> which should fit for most audio requirements.
> 
> >
> > However, this means we have to switch the parent clock to the audio pll
> > 1. For the simple setup with two SAIs, one for analog audio and one for
> > HDMI this wouldn't be a problem. But I'm not sure if this is a good
> > solution if a customer would add a third SAI which requires again a
> > different parent clock rate.
> 
> We won't change the PLL's rate in the driver,  so as PLL_0 for 48kHz,
> PLL_1 for 44kHz,  even with a third SAI or more,  they should work.
> 
> >
> > One potential solution could be that the SAI driver tries to first
> > derive the clock from the current parent and only if this fails it tries
> > to modify its parent clock. What do you think about this solution?
> >

I did some more testing and I'm still not happy with the current
solution. The problem is that if we change the SAI5 mclk clock parent it
can either support the 44kHz series or the 48kHz series. However, in the
case of HDMI we do not know in advance what the user wants.

This means when testing either this works:
speaker-test -D hw:2,0 -r 48000 -c 2
or this works:
speaker-test -D hw:2,0 -r 44100 -c 2
With:
card 2: imxaudiohdmitx [imx-audio-hdmi-tx], device 0: i.MX HDMI i2s-hifi-0 [i.MX HDMI i2s-hifi-0]

If I on the other hand avoid that fsl_sai_set_mclk_rate is called by
patching imx-hdmi.c. I can make both rates work with the standard clock
settings. So I wonder if calling snd_soc_dai_set_sysclk is really
necessary for the i.MX8?
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index f9cec6f0aecd..7d8aa58645b7 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -92,15 +92,6 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
        u32 slot_width = data->cpu_priv.slot_width;
        int ret;

-       /* MCLK always is (256 or 192) * rate. */
-       ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
-                                    8 * slot_width * params_rate(params),
-                                    tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
-       if (ret && ret != -ENOTSUPP) {
-               dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
-               return ret;
-       }
-
        ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, slot_width);
        if (ret && ret != -ENOTSUPP) {
                dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret);

Regards,
Stefan


