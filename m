Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B9153827
	for <imx@lists.linux.dev>; Fri,  3 May 2024 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743125; cv=none; b=cw58VvGfd8kcF9I7sFj9Q58clC2ewDgHOC8KfICGwCxp/hb+iezBwS8zafliFuIzE2+FiD+d5Y9mmapLyZuLyfoyCR9FFes86UjUR2ZjO9Zw35kfT87EflOk7E3H+bt83dSbQPDKwiPqAj2BNm6NpXAsGsOQiBrlSEbHuNPeJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743125; c=relaxed/simple;
	bh=cTVlexL21VGFepN74j4i+Cx3kguryHGvXYFI4l99agc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjvsXklkA+GJiqe2UrF2mNOLTFwSwhPcGzfuJQu55twQuK3Q38DvrK1rKPw31yiotqoUjclH0tJ+7nYE8RITtAC9+Jpf5nMiN3L0nTYhufMWBPqnBCCZHJY+dhY87dsoi4WzBHXJHwb+9BCQpy1cAmMMV/mB6ktHU5Tt4vXcSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OrLv3oYJ; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrLv3oYJ"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-34d7b0dac54so1724714f8f.0
        for <imx@lists.linux.dev>; Fri, 03 May 2024 06:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714743120; x=1715347920; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=undWXncs4kVUzJZvRIVl4FbGQg+claJAtvTWcguFiXg=;
        b=OrLv3oYJI292ee5LDZPCS35bCA0m8U5yPE7NrhT0QEDhjUFgdDwKfaS0PX/vMCOIQT
         y4EG64QRb0QlsIgsGHAHfgIrr9UKBAYmHJ9tOjcA9YdtNTbXAZpvvNxUNKUt/Ca+jwrq
         NSMr1fQ/23VyjXvI7RDIBt0U8V0FarzNO4XP8hsUQEpYM4ql9nzgYR11JTJqqB5wY9wo
         T1ulzac3g+06VKg7co2jtSPvz8cp8/SyIC8iwfyCowduVnAQwpTCOnycmAPf+PysNkuj
         mEr+Z8Hl7uChIZTBHFD4fmeilyOAHA0gYNVObZfE9fwLez1bn54ZE+ZolX54db8wQlhV
         TpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743120; x=1715347920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=undWXncs4kVUzJZvRIVl4FbGQg+claJAtvTWcguFiXg=;
        b=WSk1yzh9cALAILEL0qNQgJA2JrkmX5JCjVcyyvYeFX18PTgzETYbpRVW2eddtAs8ui
         x9jRFStcGS5x7vPUX1E+AbErxoUCWF1NRxiiBfl1X1yEJWKX1heT/7YPtpak1o2qBwux
         PpNEJEd9KBRpTRSR1iJrBzOJKyEVLKbeFdxmQmFuVfGSZSq1OF0s15OVbXBxKiWYV5m/
         d+FcZ9U4FafVVkPWSP/jQkW0zOKnIlwZbZkqHmzgW0wKq+/mZSNMVHKAEotzftqUam+/
         IVWt2tLebZcMxezcciKZDlPSbF6eBn7rTbfBuGUUl/qoQO5cnKTSfn80SCjiAU5VYQkH
         pOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm+CJFEG4vkg9AxE7upNmaRbW+mJKv02wChVak/pic0kjjEkUTaLkUcMhobB1Cbe3irmAOo+eX06nT/Q36wsTBu0j2
X-Gm-Message-State: AOJu0YzC+O8MSuUzjgMTxy8c0+wtsv0vhd4UzAT+Mr0xx0BFa8KS0Csn
	Px02ElSyHnc5K/czRMgLnWVygFciNRlr5TQ3dIvQNkV08TEG1H+CxVRf5FMaMYY=
X-Google-Smtp-Source: AGHT+IETjsgwQy/qvOiAAnwQCpHG3yXdPCwZC7bqBuF4vxQ5WqIBAZ+fO/tzQ8ILthwjo7kX9zxGdA==
X-Received: by 2002:a5d:67c4:0:b0:346:f830:db09 with SMTP id n4-20020a5d67c4000000b00346f830db09mr2498925wrw.31.1714743120397;
        Fri, 03 May 2024 06:32:00 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id z18-20020adff752000000b0034e19861891sm3781429wrp.33.2024.05.03.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 06:31:59 -0700 (PDT)
Message-ID: <0d1b703c-5cad-4888-8966-d2a33fe19ce8@linaro.org>
Date: Fri, 3 May 2024 14:31:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SM6350-mainline : IMX412 Hack to IMX576 driver and CAMSS
To: Joffrey <joffrey575@freewind.fr>, gregkh@linuxfoundation.org,
 imx@lists.linux.dev
Cc: dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
 andrey.konovalov@linaro.org, Luca Weiss <luca.weiss@fairphone.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <487-6634c200-31-76b8f080@88927481>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <487-6634c200-31-76b8f080@88927481>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2024 11:52, Joffrey wrote:
> Hi all,
> 
> I'm working in my free time on camss driver and *imx412 hack for imx576 
> driver camera* for Fairphone 4 (*sm7225 from sm6350-mainline*).
> I want the sm6350-mainline progress in the futur, postmarketos and linux 
> for mobile.
> 
> Targets are 750G (SM7225) and 690G (SM6350) Qualcomm Snapdragon.
> 
> The source code is : 
> https://github.com/sm6350-mainline/linux/tree/sm6350-6.9-wip-camera 
> <https://github.com/sm6350-mainline/linux/tree/sm6350-6.9-wip-camera>
> 
> **Some work have been initialised by z3ntu (lweiss-fairphone) but he 
> don't arrived to get data from imx576 camera.
> Just arrived to generate a test_pattern = 2 from msm_csid0 until 
> msm_vfe0_rdi0.*
> 
> *The relation between v4l2 and msm entity is the following what i've 
> create from dot file.
> https://debian-facile.org/images/file-Rc0e5e8df8ab6edd1812f4be9187b1ad3 
> <https://debian-facile.org/images/file-Rc0e5e8df8ab6edd1812f4be9187b1ad3>
> 
> I followed his advice and adapt command to get data from imx576 camera.
> 
> fairphone-fp4:~$ media-ctl -d /dev/media0 -l 
> '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> fairphone-fp4:~$ media-ctl -d /dev/media0 -l 
> '"msm_csiphy3":1->"msm_csid0":0[1]'
> fairphone-fp4:~$ media-ctl -d /dev/media0 -V 
> '"msm_csid0":1[fmt:UYVY8_2X8/1920x1080 field:none],"msm_vfe0_rdi0":0[fmt:UY
> VY8_2X8/1920x1080 field:none]'
> fairphone-fp4:~$ media-ctl -d /dev/media0 -V 
> '"msm_csiphy3":1[fmt:UYVY8_2X8/1920x1080 field:none],"msm_csid0":0[fmt:UYVY
> 8_2X8/1920x1080 field:none]'
> fairphone-fp4:~$ gst-launch-1.0 -v v4l2src device=/dev/video0 
> num-buffers=1 ! 'video/x-raw,format=UYVY,width=1920,height
> =1080' ! jpegenc ! filesink location=image01.jpg
> 
> I have this error log.
> https://debian-facile.org/paste-BEAC75F7C4-6eda8795dcd0e61b297cbbeac1aa0f26 <https://debian-facile.org/paste-BEAC75F7C4-6eda8795dcd0e61b297cbbeac1aa0f26>
> 
> And dmesg log.
> https://debian-facile.org/paste-E52C41445A-f50445aa608fd5a868d84f8253db091b <https://debian-facile.org/paste-E52C41445A-f50445aa608fd5a868d84f8253db091b>
> 
> 
> I talk about this problem to the community and said it to me.
> 
>     Yeah we need to find a tag in that repo
>     that matches in some way one of the tags here
>     https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel.git
>     that's the CPHY/CSID/IFE version to target
>     i.e. know which CSIPHY init sequence to use - if we can reuse an
>     upstream CSID/IFE - and get the reg offsets right
> 
> 
> Here is the good tree about sm6350/sm7225.
> LA.QSSI.11.0.R1.11.00.00.668.170.00
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/tree/camera-kernel.lnx.3.1.r9-rel?ref_type=heads <https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/tree/camera-kernel.lnx.3.1.r9-rel?ref_type=heads>
> 
> 
> => What are differencies to adapt between camss driver and imx driver 
> architecture between this two project ?
> -this link 
> https://github.com/sm6350-mainline/linux/tree/sm6350-6.9-wip-camera 
> <https://github.com/sm6350-mainline/linux/tree/sm6350-6.9-wip-camera>
> -this link 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/tree/camera-kernel.lnx.3.1.r9-rel?ref_type=heads <https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/tree/camera-kernel.lnx.3.1.r9-rel?ref_type=heads>
> 
> @bryan,
> I contact you for your work here [PATCH v2 0/3] Add imx577 compatible to 
> imx412.
> https://www.spinics.net/lists/linux-media/msg215880.html 
> <https://www.spinics.net/lists/linux-media/msg215880.html>
> Have you arrived to get data from imx577 camera ?

Yes it works on RB5 upstream.

https://github.com/sm6350-mainline/linux/blob/sm6350-6.9-wip-camera/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts

Taking a quick look

https://github.com/sm6350-mainline/linux/blob/sm6350-6.9-wip-camera/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts#L574

I would double check the MCLK value there - pairing of MCLK1 with 
CSIPHY3 is a bit unusual - 100% valid but, unusual.

> Be appear, the job to adapt is to check in the following code these 
> steps but it's hard to identify for me.
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/tree/camera-kernel.lnx.3.1.r9-rel?ref_type=heads <https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/tree/camera-kernel.lnx.3.1.r9-rel?ref_type=heads>
> 
> "that's the CPHY/CSID/IFE version to target" -> What mean exactly ?
> 1 - i.e. know which CSIPHY init sequence to use
> 2 - if we can reuse an upstream CSID/IFE
> 3 - and get the reg offsets right

So there are a number of things here.

1. Identify the correct CSIPHY init sequence
    I'd guess @Luca probably has that right but, I suggest
    you double check.

2. Identify the IFE and CSID versions
    As I posted on IRC its definitely IFE 17x
    Probably the same CSID as on sdm845 too

3. My understanding is the TPG partially works on this platform
    I suggest trying different pixel formats and resolutions

Here's an example for the RB5

# CSID0 TPG RB5
media-ctl --reset
yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev6
yavta --list /dev/v4l-subdev6
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p

Figure out which V4L subdev == msm_csid0 on your platform and then set 
the yavta command appropriately.

> If it's possible to have advice, documentation, identifying parts or 
> solution ? (Maybe more simple to do video call or audio ?)

What you need to get say Hangouts or Zoom going is

1. Delivery of data to userpsace via RDI

2. libcamera >= below [1]
    zoom and cheese will work that this stage

3. pipewire compiled up to talk to libcamera
    Assuming this works as below [2] you will get
    Hangouts

4. For postmarketos you will need to adapt the
    camera application - I guess - to talk to libcamera

> 
> Maybe it's better i learn some part before discuss.

I'd suggest replicating Luca's TPG work and then trying different pixel 
formats and resolutions.

Is it always the case you get partial data or do you get a full frame at 
a different _resolution_ ?

Next step then is to bring up the sensor.

The "cam" application in libcamera will probably be lots of help.

[1] SoftISP in libcamera
https://git.libcamera.org/libcamera/libcamera.git/commit/?id=b2ef255295871fb6246d99bdd5b41aa65e3fc3b2

[2] Firefox/pipewire integration with libcamera
https://jgrulich.cz/2023/05/29/pipewire-camera-support-in-firefox/

---
bod

